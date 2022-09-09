import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/LoginController.dart';
class LoginPage extends GetView<LoginController> {
  
  const LoginPage({Key? key}) : super(key: key);

        UnderlineInputBorder myinputborder(){ //return type is OutlineInputBorder
        return const UnderlineInputBorder( //Outline border type for TextFeild
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
              color:Colors.grey,
              width: 1,
            )
        );
      }

      UnderlineInputBorder myfocusborder(){
        return const UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color:Color(0xFFba57ea),

              width: 1,
            )
        );
      }


  @override
  Widget build(BuildContext context) {

    

    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
      body :  SafeArea(
        child:GetBuilder<LoginController>(
          builder: (_) {
           return  Column(
            
            crossAxisAlignment: CrossAxisAlignment.stretch,
            
            children: [
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
             Expanded(
              child: Container(
             
                decoration:  const BoxDecoration(
                     color: Colors.white,
                     borderRadius:  BorderRadius.only(topLeft: Radius.circular(40),topRight:Radius.circular(40)  ),
                     boxShadow:  [
                        BoxShadow(
                        
                       color: Colors.grey,
                       blurRadius: 2,
                       offset: Offset(0,-1)
                     )]),
              
                 child: SingleChildScrollView(
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Column(
                      
                      children: [
                      
                        const SizedBox(height: 20),
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                           child: TextField(
                             autofocus: true,
                             decoration: InputDecoration(
                               contentPadding: EdgeInsets.all(10),
                               labelText: 'Username',
                               prefixIcon: Icon(Icons.person),
                               enabledBorder: myinputborder(),
                               focusedBorder: myfocusborder(),
                             ),
                      
                           ),
                           
                           ),
                          const SizedBox(height: 20),
                            Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                           child: TextField(
                             autofocus: true,
                             decoration: InputDecoration(
                               contentPadding:  EdgeInsets.all(10),
                               labelText: 'Password',
                               prefixIcon: const Icon(Icons.password_sharp),
                               enabledBorder: myinputborder(),
                               focusedBorder: myfocusborder(),
                               suffixIcon: const Icon(Icons.visibility),
                               
                             ),
                           ),
                           ),
                             const SizedBox(height: 10),
                            CheckboxListTile(
                             value: controller.rememberMe,
                             title: Text('Remember me'),
                             controlAffinity: ListTileControlAffinity.leading,
                             onChanged: ((value) {
                               controller.rememberMe = value;
                             })),
                            const SizedBox(height: 20 ),
                           InkWell(onTap: (() {
                            controller.goToHome();
                           }),
                           child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 50),
                                  decoration:  const BoxDecoration(
                             color:Color(0xFFba57ea),
                            borderRadius:  BorderRadius.all(Radius.circular(50)),
                            gradient: LinearGradient(colors: [
                              Color(0xFFba57ea),
                              Color(0xFFa958ba),
                              Color(0xFFbd389a)
                            ],begin: Alignment.centerLeft),
                            boxShadow:  [
                              BoxShadow(
                              color:Color(0xFFba57ea),
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
                           ),)
                      ],
                     ),
                   ),
                 ),
              ),
             )
            ],
           );
        }) 
        )
      ),
    );
  }
}


