import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'network/login_provider.dart';
import 'ui/pages/login.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => LoginProvider())],
    child: Login(),
  ));
}

