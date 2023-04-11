import 'package:flutter_projects/ui/auth/login_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'app_routes.dart';

class AppPages {
  static final getPages = [
    GetPage(name: AppRoutes.authPage, page: ()=>const LoginScreen()),
  ];
}