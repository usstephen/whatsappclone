import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappclone/Common/Theme/dark_theme.dart';
import 'package:whatsappclone/Common/extension/custom_theme_extension.dart';
import 'package:whatsappclone/feature/auth/Pages/login_pages.dart';

import 'Common/Theme/light_theme.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      home: LoginPages()
    );
  }
}



