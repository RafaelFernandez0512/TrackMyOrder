import 'package:get/get.dart';
import 'package:track_my_order_app/app/bindings/login_binding.dart';
import 'package:track_my_order_app/app/ui/pages/home/home_page.dart';

import '../bindings/home_binding.dart';
import '../ui/pages/authentication/login_page.dart';

part './app_routes.dart';

abstract class AppPages {

  static final pages = [
    GetPage(
      name: Routes.LOGIN, 
      page:()=> LoginPage(),
      binding: LoginBinding()
      ),
     GetPage(
      name: Routes.HOME, 
      page:()=> HomePage(),
      binding: HomeBinding()
      ),
  ];
}