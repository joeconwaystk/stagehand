import 'dart:io' as io;

import 'package:args/args.dart';
import 'cli_app.dart';

class CliArgs {
  CliArgs(List<String> args, [CliLogger logger]) {
    _parser = new ArgParser()
      ..addFlag('analytics',
          negatable: true,
          help: 'Opt out of anonymous usage and crash reporting.')
      ..addFlag('help', abbr: 'h', negatable: false, help: 'Help!')
      ..addFlag('version',
          negatable: false, help: 'Display the version for ${APP_NAME}.')
      ..addOption('author',
          defaultsTo: '<your name>',
          help: 'The author name to use for file headers.')
      // Really, really generate into the current directory.
      ..addFlag('override', negatable: false, hide: true)
      // Output the list of available projects as json to stdout.
      ..addFlag('machine', negatable: false, hide: true)
      // Mock out analytics - for use on our testing bots.
      ..addFlag('mock-analytics', negatable: false, hide: true);

    try {
      _results = _parser.parse(args);
    } catch (e) {
      // FormatException: Could not find an option named "foo".
      if (e is FormatException) {
        logger?.stdout('Error: ${e.message}');
        throw new ArgError(e.message);
      }

      rethrow;
    }
  }

  ArgParser _parser;
  ArgResults _results;

  String get usage => _parser.usage;
  bool get hasAnalyticsFlag => _results.wasParsed('analytics');
  bool get shouldEnableAnalytics => _results['analytics'];
  bool get shouldMockAnalytics => _results['mock-analytics'];
  bool get shouldDisplayVersion => _results['version'];
  bool get shouldDisplayHelp => _results['help'];
  bool get overrideNonEmptyDirectory => _results['override'];
  List<String> get templateIdentifiers => _results.rest;

  // The `--machine` option emits the list of available generators to stdout
  // as Json. This is useful for tools that don't want to have to parse the
  // output of `--help`. It's an undocumented command line flag, and may go
  // away or change.
  bool get displayAsMachineReadable => _results['machine'];

  String get author {
    String author = _results['author'];

    if (!_results.wasParsed('author')) {
      try {
        io.ProcessResult result =
            io.Process.runSync('git', ['config', 'user.name']);
        if (result.exitCode == 0) {
          author = result.stdout.trim();
        }
      } catch (_) {}
    }

    return author;
  }
}
