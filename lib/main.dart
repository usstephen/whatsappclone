import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappclone/Common/Theme/dark_theme.dart';
import 'package:whatsappclone/Common/Theme/light_theme.dart';
import 'package:whatsappclone/feature/auth/Pages/signup.dart';
import 'package:whatsappclone/feature/auth/Pages/user_infor_page.dart';
import 'package:whatsappclone/feature/welcome/pages/Widget/app_routes.dart';
import 'package:whatsappclone/feature/welcome/pages/welcome_page.dart';
import 'package:whatsappclone/feature/welcome/pages/Widget/app_routes.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'feature/auth/Pages/login_pages.dart';


void main()async{
  await Hive.initFlutter();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key, this.Routes});
  final Routes;


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.initial,
      getPages:AppRoutes.pages,
      unknownRoute: GetPage(name: '/not-found', page: () => const Scaffold(
        body: Center(child: Text('No route defined'),),
      )
      ),
    

    );
  }
}



