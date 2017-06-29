// Copyright (c) {{year}}, {{author}}. All rights reserved. Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:__projectName__/__projectName__.dart';
import 'package:aqueduct/test.dart';

export 'package:__projectName__/__projectName__.dart';
export 'package:aqueduct/test.dart';
export 'package:test/test.dart';
export 'package:aqueduct/aqueduct.dart';

/// A testing harness for __projectName__.
///
/// Use instances of this class to start/stop the test __projectName__ server. Use [client] to execute
/// requests against the test server.  This instance will use configuration values
/// from config.src.yaml.
class TestApplication {
  Application<AppSink> application;
  AppSink get sink => application.mainIsolateSink;
  TestClient client;

  /// Starts running this test harness.
  ///
  /// This method will start an [Application] with [AppSink]. Invoke this method
  /// in setUpAll (or setUp, depending on your need).
  ///
  /// You must call [stop] on this instance when tearing down your tests.
  Future start() async {
    RequestController.letUncaughtExceptionsEscape = true;
    application = new Application<AppSink>();
    application.configuration.port = 0;
    application.configuration.configurationFilePath = "config.src.yaml";

    await application.start(runOnMainIsolate: true);

    client = new TestClient(application);
  }

  /// Stops running this application harness.
  ///
  /// This method must be invoked in tearDownAll or tearDown to free up operating system
  /// resources.
  Future stop() async {
    await application?.stop();
  }
}
