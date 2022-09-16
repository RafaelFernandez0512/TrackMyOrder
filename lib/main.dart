import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:track_my_order_app/app/bindings/splashScreen_binding.dart';
import 'package:track_my_order_app/app/routes/app_pages.dart';
import 'package:track_my_order_app/app/ui/themes/light_theme.dart';

import 'app/data/service/notification_service.dart';

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    NotificationService().initNotification();
  runApp(GetMaterialApp(
    getPages: AppPages.pages,
    initialRoute: Routes.SPLASH,
    defaultTransition: Transition.circularReveal,
    theme: appThemeData,
    initialBinding: SplashScreenBinding(),
  ));
}

