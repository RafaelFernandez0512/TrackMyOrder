import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:track_my_order_app/app/routes/app_pages.dart';

import '../data/service/logitrackapi_service.dart';



// HANDLE PAGE 
class LoginController extends GetxController with StateMixin {

late final LogitrackApiService _logitrackApiService;
 RxBool isBusy = false.obs;
late final TextEditingController customerTextController;
RxBool canContinue = false.obs;
 
//final MyRepository repository;
LoginController(LogitrackApiService logitrackApiService){


  _logitrackApiService = logitrackApiService;
  customerTextController = TextEditingController();
  customerTextController.addListener(() {
    canContinue.value = customerTextController.text.isNotEmpty;
  });
  change(null,status: RxStatus.empty());
  
}

  RxBool rememberMe = false.obs;
Future<void> login() async {
    try 
    {
      isBusy.value = true;
     // change(null,status: RxStatus.loading());
      // var shipments  = await _logitrackApiService.getShiptment(customerTextController.text);
      // if(shipments.isEmpty)
      // {
      //   change(null,status: RxStatus.empty());
      // }
      //change(shipments.first,status: RxStatus.success());
      isBusy.value = false;
      Get.offAndToNamed(Routes.TrackOrder,arguments: customerTextController.text);

    } catch (e) 
    {
      customerTextController.clear(); 
      isBusy.value = false;
    //  change(null,status: RxStatus.error(e.toString()));
    }

  }
}