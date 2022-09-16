import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:timelines/timelines.dart';

import '../../../controllers/LoginController.dart';



class LoginPage extends GetView<LoginController> {
  
  const LoginPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return Container(
                  decoration: const BoxDecoration(
                                            gradient: LinearGradient(colors: [
                              
                               Color(0xFF5690B7),
                              Color(0xFF2f529a), 
                              Color(0xFF2f529a),  
                               Color(0xFF4e3aa9)
                             ],begin: Alignment.topCenter),),
      child: Scaffold(
        backgroundColor: Colors.transparent,
      body :  SafeArea(
        child:GetBuilder<LoginController>(
          builder: (_) {
           return  Column(
             children: [
               SingleChildScrollView(
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                   const SizedBox(height: 70),
                    Container(
                      height: 250,
                      padding: EdgeInsets.all(5),
                      child: Column(children: [
                        Image.asset('assets/banner-tracking.png', 
                        width: 400,
                        height: 200,
                        fit: BoxFit.fitWidth,
                      ),
                    
                      ],)
                    ),
                   Container(
                      padding:  const EdgeInsets.all(8.0),
                      margin:  const EdgeInsets.symmetric(horizontal: 20),
                     decoration:  const BoxDecoration(
                          color: Colors.white,
                          borderRadius:  BorderRadius.all(Radius.circular(20)),
                          boxShadow:  [
                             BoxShadow(
                             
                            color: Colors.grey,
                            blurRadius: 2,
                            offset: Offset(1,1)
                          )]),
                   
                      child: Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                      const  Text('Customer Code:',
                                textAlign: TextAlign.start,
                                style:  TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal
                                ),),
                         const SizedBox(height: 20),

                          FittedBox(
                            child: PinCodeTextField(
                                              autofocus: true,
                                              controller: controller.customerTextController,
                                              hideCharacter: false,
                                              highlight: true,
                                              highlightColor: Colors.blue,
                                              defaultBorderColor: Theme.of(context).primaryColor,
                                              hasTextBorderColor: Theme.of(context).primaryColor,
                                              highlightPinBoxColor: Colors.transparent,
                                              maxLength: 6,
                                              pinBoxWidth: 50,
                                              pinBoxHeight: 64,
                                              hasUnderline: false,
                                              wrapAlignment: WrapAlignment.spaceAround,
                                              pinBoxDecoration:
                              ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                                              pinTextStyle: TextStyle(fontSize: 22.0),
                                              pinTextAnimatedSwitcherTransition:
                              ProvidedPinBoxTextAnimation.scalingTransition,
                          //                    pinBoxColor: Colors.green[100],
                                              pinTextAnimatedSwitcherDuration:
                            const  Duration(milliseconds: 300),
                              pinBoxRadius: 10  ,
                          //                    highlightAnimation: true,
                                              highlightAnimationBeginColor: Colors.black,
                                              highlightAnimationEndColor: Colors.white12,
                                              keyboardType: TextInputType.number,
                                            ),
                          ),
                         
                             const SizedBox(height: 30 ),
                            Obx( ()=> Visibility(
                               visible: !controller.isBusy.value&&controller.canContinue.value,
                                child: InkWell(onTap: (() {
                                controller.login();
                                }),
                                
                                child: Container(
                                 margin: const EdgeInsets.symmetric(horizontal: 50),
                                       decoration:  const BoxDecoration(
                                  color:Color(0xFF5690B7),
                                 borderRadius:  BorderRadius.all(Radius.circular(50)),
                                 gradient: LinearGradient(colors: [
                                  
                                   Color(0xFF5690B7),
                                  Color(0xFF2f529a), 
                                  Color(0xFF2f529a),  
                                   Color(0xFF4e3aa9)
                                 ],begin: Alignment.centerLeft),
                                 boxShadow:  [
                                   BoxShadow(
                                    color:Color(0xFF5690B7),
                                   blurRadius: 7,
                                   offset: Offset(0,4)
                                 )]),
                                 padding: const EdgeInsets.all(20),
                                  
                                 width: double.infinity,
                                 child: const Text('Login',
                                   style: TextStyle(color: Colors.white,
                                   fontSize: 20,
                                   fontWeight: FontWeight.bold
                                   ),
                                     textAlign: TextAlign.center,
                                   ),
                                ),
                                ),
                              ),
                            ),
                              const SizedBox(height: 20 ),
                            controller.obx(
                              ((state ) {
                               return Text('');
                              }),
                             onLoading: const CircularProgressIndicator(),
                           
                            onError: ((error) 
                            {
                             return   Text('$error',
                                         style: const TextStyle(
                                           color: Colors.red,
                                           fontSize: 16,
                                           fontWeight: FontWeight.bold
                                         ),);
                            }) ),

                       ],
                      ),
                   ),
                  // Spacer( flex: 1),
                   
                  ],
                  
                 ),
               ),
               const Spacer( flex: 1),
               Container(
                    padding: const EdgeInsets.all(20),
                     child: const Text('(C) ITGroup Technology Consultants, Inc.',
                     style:  TextStyle(
                      fontSize: 14, 
                      color: Colors.white,
                     ),
                     textAlign: TextAlign.center,),),
             ],
           );
        }) 
        )
      ),
    );
  }
}


