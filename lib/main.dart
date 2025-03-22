import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:whatsappclone/Common/Theme/dark_theme.dart';
import 'package:whatsappclone/Common/extension/custom_theme_extension.dart';
import 'package:whatsappclone/feature/auth/Pages/login_pages.dart';
import 'package:whatsappclone/model/user.dart';

import 'Common/Theme/light_theme.dart';
import 'Common/routes/app_routes.dart';
import 'feature/welcome/pages/welcome_page.dart';

late UserModel currentUser;


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  var box = await Hive.openBox<UserModel>('user');
  currentUser = box.get("current")!;
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
      initialRoute: AppRoutes.initial,
      getPages: AppRoutes.pages,
      unknownRoute: GetPage(
        name: '/not-found',
        page: () => const Scaffold(
          body: Center(child: Text('No route defined')),
        ),
      ),
    );
  }
}



