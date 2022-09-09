import 'package:get/get.dart';
import 'package:track_my_order_app/app/routes/app_pages.dart';



// HANDLE PAGE 
class LoginController extends GetxController {

//final MyRepository repository;
LoginController();

  final _obj = ''.obs;
  bool? rememberMe ;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;

  void goToHome() {
    Get.offAndToNamed(Routes.HOME);
  }

}