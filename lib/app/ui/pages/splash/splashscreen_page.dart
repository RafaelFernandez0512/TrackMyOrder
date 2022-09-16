
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/SplashScreenController.dart';


class SplashScreenPage extends GetView<SplashScreenController> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashScreenController>(
        builder: (controller) {
          return Container(
             decoration: const BoxDecoration(
                                            gradient: LinearGradient(colors: [
                              
                               Color(0xFF5690B7),
                              Color(0xFF2f529a), 
                              Color(0xFF2f529a),  
                               Color(0xFF4e3aa9)
                             ],begin: Alignment.topCenter),),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/banner-tracking.png'),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}