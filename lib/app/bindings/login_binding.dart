import 'package:get/get.dart';

import '../controllers/LoginController.dart';

class LoginBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<LoginController>(() => LoginController());
  }
} 