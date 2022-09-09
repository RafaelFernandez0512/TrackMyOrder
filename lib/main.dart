import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:track_my_order_app/app/bindings/home_binding.dart';
import 'package:track_my_order_app/app/bindings/login_binding.dart';
import 'package:track_my_order_app/app/routes/app_pages.dart';
import 'package:track_my_order_app/app/ui/themes/light_theme.dart';

void main() {
  runApp( GetMaterialApp(
    getPages: AppPages.pages,
    initialRoute: Routes.HOME,
    defaultTransition: Transition.fade,
    theme: appThemeData,
    initialBinding: HomeBinding(),


  ));
}

