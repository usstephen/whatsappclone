import 'package:get/get.dart';
import 'package:whatsappclone/feature/home/home_screen.dart';
import 'package:whatsappclone/feature/welcome/pages/welcome_page.dart';
import 'package:whatsappclone/main.dart';

import '../../feature/auth/Pages/login_pages.dart';

class AppRoutes{
  static String initial = '/';

  static final List<GetPage> pages= [
    GetPage(name: '/', page: () => const WelcomePage()),
    GetPage(name: '/login', page: () => const LoginPages()),
    GetPage(name: '/home', page: () => const HomeScreen()),
  ];
}