import 'package:get/get.dart';
import 'package:whatsappclone/feature/welcome/pages/welcome_page.dart';

import '../../feature/auth/Pages/login_pages.dart';

class AppRoutes{
  static const String initial = '/';

  static final List<GetPage> pages= [
    GetPage(name: '/', page: () => const WelcomePage()),
    GetPage(name: '/login', page: () => const LoginPages()),
  ];
}