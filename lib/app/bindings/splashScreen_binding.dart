import 'package:get/get.dart';

import '../controllers/SplashScreenController.dart';

class SplashScreenBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<SplashScreenController>(() => SplashScreenController());
  }
}