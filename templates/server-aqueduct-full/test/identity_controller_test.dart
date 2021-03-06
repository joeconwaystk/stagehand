// Copyright (c) {{year}}, {{author}}. All rights reserved. Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import 'harness/app.dart';

Future main() async {
  TestApplication app = new TestApplication();

  setUpAll(() async {
    await app.start();
  });

  tearDownAll(() async {
    await app.stop();
  });

  tearDown(() async {
    await app.discardPersistentData();
  });

  group("Success cases", () {
    test("Identity returns user associated with bearer token", () async {
      var req = app.client.clientAuthenticatedRequest("/register")
        ..json = {
          "username": "bob@stablekernel.com",
          "password": "foobaraxegrind12%"
        };

      var accessToken = (await req.post()).asMap["access_token"];
      req = app.client.authenticatedRequest("/me", accessToken: accessToken);
      var result = await req.get();

      expect(
          result,
          hasResponse(
              200,
              partial({
                "id": greaterThan(0),
                "email": "bob@stablekernel.com",
                "username": "bob@stablekernel.com"
              })));
    });
  });
}
