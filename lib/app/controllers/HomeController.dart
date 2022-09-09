import 'package:get/get.dart';
import 'package:track_my_order_app/app/routes/app_pages.dart';

class HomeController extends GetxController {
HomeController();

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;

  
}