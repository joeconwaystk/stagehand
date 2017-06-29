// Copyright (c) {{year}}, {{author}}. All rights reserved. Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import '../__projectName__.dart';
import '../model/user.dart';

class IdentityController extends HTTPController {
  @httpGet
  Future<Response> getIdentity() async {
    var q = new Query<User>()
      ..where.id = request.authorization.resourceOwnerIdentifier;

    var u = await q.fetchOne();
    if (u == null) {
      return new Response.notFound();
    }

    return new Response.ok(u);
  }
}
