import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../screens/auth/shop_login.dart';
import '../network/cache_helper.dart';

String? token = '';

void SignOut(context) {
  CacheHelper.removeData(key: 'token').then((value) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  });
}
