import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappclone/Common/Theme/dark_theme.dart';
import 'package:whatsappclone/Common/Theme/light_theme.dart';
import 'package:whatsappclone/feature/auth/Pages/login_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      home: const LoginPages()
    );
  }
}



