// Copyright (c) {{year}}, {{author}}. All rights reserved. Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'package:__projectName__/__projectName__.dart';

Future main() async {
  var app = new Application<AppSink>()
      ..configuration.configurationFilePath = "config.yaml"
      ..configuration.port = 8000;

  await app.start(numberOfInstances: 2);

  print("Application started on port: ${app.configuration.port}.");
  print("Use Ctrl-C (SIGINT) to stop running the application.");
}