import 'package:get/get.dart';

import '../controllers/LoginController.dart';
import '../data/service/logitrackapi_service.dart';

class LoginBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<LoginController>(() => LoginController(LogitrackApiService()));
  }
} 