import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:track_my_order_app/app/routes/app_pages.dart';

class SplashScreenController extends GetxController
    with GetSingleTickerProviderStateMixin  {

late AnimationController animationController;
  late Animation<double> animation;
  bool navigate = false;

  @override
  void onInit() {
    animationInitilization();
    super.onInit();
  }

  animationInitilization() {

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut)
            .obs
            .value;
          
    animation.addStatusListener((status)
    {
      if(animation.isCompleted){
         Get.offAllNamed(Routes.LOGIN); 
      }
       
      update(); 

      
    } );
    animationController.forward();
    
   // 
  }
}