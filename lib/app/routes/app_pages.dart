import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:get/get.dart';
import 'package:track_my_order_app/app/bindings/login_binding.dart';
import 'package:track_my_order_app/app/bindings/splashScreen_binding.dart';
import 'package:track_my_order_app/app/bindings/track_order_binding.dart';
import 'package:track_my_order_app/app/controllers/SplashScreenController.dart';
import 'package:track_my_order_app/app/ui/pages/splash/splashscreen_page.dart';
import 'package:track_my_order_app/app/ui/pages/track/trackOrder_page.dart';
import '../ui/pages/authentication/login_page.dart';

part './app_routes.dart';

abstract class AppPages {

  static final pages = [
    GetPage(
      name: Routes.LOGIN, 
      page:()=> const LoginPage(),
      binding: LoginBinding()
      ),
     GetPage(
      name: Routes.TrackOrder, 
      page:()=> TrackOrderPage(),
      binding: TrackOrderBinding()
      ),
           GetPage(
      name: Routes.SPLASH, 
      page:()=> SplashScreenPage(),
      binding: SplashScreenBinding()
      ),
  ];
}