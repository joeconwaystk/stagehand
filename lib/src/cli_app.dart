// Copyright (c) 2014, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:convert' show JSON;
import 'dart:io' as io;
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:stagehand/src/common.dart';
import 'package:stagehand/stagehand.dart';
import 'package:usage/usage_io.dart';

import 'cli_args.dart';

const String APP_NAME = 'stagehand';

// This version must be updated in tandem with the pubspec version.
const String APP_VERSION = '1.1.4+1';

// The Google Analytics tracking ID for stagehand.
const String _GA_TRACKING_ID = 'UA-55033590-1';

class CliApp {
  CliApp(this.generators, this.logger, {this.target, String pubVersionURL})
      : _pubVersionURL = pubVersionURL {
    assert(generators != null);
    assert(logger != null);

    analytics = new AnalyticsIO(_GA_TRACKING_ID, APP_NAME, APP_VERSION);

    generators.sort();
  }

  static final Duration _timeout = const Duration(milliseconds: 500);

  final List<Generator> generators;
  final CliLogger logger;
  final String _pubVersionURL;

  String get pubVersionURL => _pubVersionURL ?? 'https://pub.dartlang.org/packages/${APP_NAME}.json';
  GeneratorTarget target;
  Analytics analytics;

  CliArgs options;
  io.Directory _currentWorkingDirectory;

  io.Directory get currentWorkingDirectory =>
      _currentWorkingDirectory ?? io.Directory.current;

  String get projectName =>
      normalizeProjectName(path.basename(currentWorkingDirectory.path));

  /**
   * An override for the directory to generate into; public for testing.
   */
  set currentWorkingDirectory(io.Directory value) {
    _currentWorkingDirectory = value;
  }

  Future process(List<String> args) async {
    options = new CliArgs(args, logger);

    if (options.hasAnalyticsFlag) {
      return _sendAnalyticsIfAllowed(options);
    }

    // This hidden option is used so that our build bots don't emit data.
    if (options.shouldMockAnalytics) {
      analytics = new AnalyticsMock();
    }

    if (options.shouldDisplayVersion) {
      return _displayVersion();
    }

    if (options.shouldDisplayHelp || args.isEmpty) {
      // Prompt to opt into advanced analytics.
      if (analytics.firstRun) {
        _promptForAnalyticsPermission();
      }

      _screenView(options.shouldDisplayHelp ? 'help' : 'main');
      _usage(options.usage);
      return analytics.waitForLastPing(timeout: _timeout);
    }

    if (options.displayAsMachineReadable) {
      _screenView('machine');
      logger.stdout(_createMachineInfo(generators));
      return analytics.waitForLastPing(timeout: _timeout);
    }

    if (options.templateIdentifiers.isEmpty) {
      logger.stderr("No generator specified.\n");
      _usage(options.usage);
      throw new ArgError('no generator specified');
    }

    if (options.templateIdentifiers.length >= 2) {
      logger.stderr("Error: too many arguments given.\n");
      _usage(options.usage);
      throw new ArgError('invalid generator');
    }

    if (!options.overrideNonEmptyDirectory &&
        !_isDirEmpty(currentWorkingDirectory)) {
      logger.stderr(
          'The current directory is not empty. Please create a new project directory, or '
          'use --override to force generation into the current directory.');
      throw new ArgError('project directory not empty');
    }

    var generator = _getGenerator(options.templateIdentifiers.first);
    return _createProject(generator, options.author);
  }

  Future _createProject(Generator generator, String author) async {
    target ??= new _DirectoryGeneratorTarget(logger, currentWorkingDirectory);

    logger.stdout("Creating ${generator.id} application '${projectName}':");

    _screenView('create');
    analytics.sendEvent('create', generator.id, label: generator.description);

    var vars = {'author': author};

    await generator.generate(projectName, target, additionalVars: vars);

    logger.stdout("${generator.numFiles()} files written.");

    var message = generator.getInstallInstructions();
    if (message != null && message.isNotEmpty) {
      message = message.trim();
      message = message.split('\n').map((line) => "--> ${line}").join("\n");
      logger.stdout("\n${message}");
    }

    return analytics.waitForLastPing(timeout: _timeout);
  }

  Future _sendAnalyticsIfAllowed(CliArgs options) {
    analytics.enabled = options.shouldEnableAnalytics;
    logger.stdout("Analytics ${analytics.enabled ? 'enabled' : 'disabled'}.");
    if (analytics.enabled) {
      analytics.sendScreenView('analytics');
    }

    return analytics.waitForLastPing(timeout: _timeout);
  }

  Future _displayVersion() async {
    logger.stdout('${APP_NAME} version: ${APP_VERSION}');
    try {
      var response = await http.get(pubVersionURL);
      List versions = JSON.decode(response.body)['versions'];
      if (APP_VERSION != versions.last) {
        logger.stdout(
            "Version ${versions.last} is available! Run `pub global activate"
            " ${APP_NAME}` to get the latest.");
      }
    } catch (_) {}
  }

  String _createMachineInfo(List<Generator> generators) {
    var itor = generators.map((generator) {
      var m = {
        'name': generator.id,
        'label': generator.label,
        'description': generator.description
      };

      if (generator.entrypoint != null) {
        m['entrypoint'] = generator.entrypoint.path;
      }

      return m;
    });

    return JSON.encode(itor.toList());
  }

  void _usage(String usage) {
    logger.stdout(
        'Stagehand will generate the given application type into the current directory.');
    logger.stdout('');
    logger.stdout('usage: ${APP_NAME} <generator-name>');
    logger.stdout(usage);
    logger.stdout('');
    logger.stdout('Available generators:');

    int len = generators.map((g) => g.id.length).fold(0, (a, b) => max(a, b));

    generators
        .map((g) => "  ${g.id.padRight(len)} - ${g.description}")
        .forEach(logger.stdout);
  }

  Generator _getGenerator(String id) {
    return generators.firstWhere((g) => g.id == id, orElse: () {
      logger.stderr("'$id' is not a valid generator.\n");
      _usage(options.usage);
      throw new ArgError('invalid generator');
    });
  }

  void _screenView(String view) {
    // If the user hasn't opted in, only send a version check - no page data.
    if (!analytics.enabled) {
      view = 'main';
    }
    analytics.sendScreenView(view);
  }

  void _promptForAnalyticsPermission() {
    logger.stdout("""
Welcome to Stagehand! We collect anonymous usage statistics and crash reports in
order to improve the tool (http://goo.gl/6wsncI). Would you like to opt-in to
additional analytics to help us improve Stagehand [y/yes/no]?""");
    io.stdout.flush();
    String response = io.stdin.readLineSync();
    response = response.toLowerCase().trim();
    analytics.enabled = (response == 'y' || response == 'yes');
    logger.stdout('');
  }

  /**
   * Returns true if the given directory does not contain non-symlinked,
   * non-hidden subdirectories.
   */
  bool _isDirEmpty(io.Directory dir) {
    var isHiddenDir = (dir) => path.basename(dir.path).startsWith('.');

    return dir
        .listSync(followLinks: false)
        .where((entity) => entity is io.Directory)
        .where((entity) => !isHiddenDir(entity))
        .isEmpty;
  }
}

class ArgError implements Exception {
  final String message;
  ArgError(this.message);
  String toString() => message;
}

class CliLogger {
  void stdout(String message) => print(message);
  void stderr(String message) => print(message);
}

class _DirectoryGeneratorTarget extends GeneratorTarget {
  final CliLogger logger;
  final io.Directory dir;

  _DirectoryGeneratorTarget(this.logger, this.dir) {
    dir.createSync();
  }

  Future createFile(String filePath, List<int> contents) {
    io.File file = new io.File(path.join(dir.path, filePath));

    logger.stdout('  ${file.path}');

    return file
        .create(recursive: true)
        .then((_) => file.writeAsBytes(contents));
  }
}
