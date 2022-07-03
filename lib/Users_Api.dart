import 'dart:convert';

import 'package:flutter/material.dart';



import 'User.dart';

class UsersApi {

  static Future<List<User>> getUsersLocally(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('assets/dataset.json');
    final body = json.decode(data);

    return body.map<User>(User.fromJson).toList();
  }

}
