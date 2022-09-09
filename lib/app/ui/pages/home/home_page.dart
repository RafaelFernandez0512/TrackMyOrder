import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/HomeController.dart';

class HomePage extends GetView<HomeController> {


Widget buildTab(String title){
    return Center( child: Container(
      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Text(title),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.red
      ),
    ));
}

List<String> tabs = [
  "A",
  "B",
  "C",
  "D",
  "F",
    "A",
  "B",
  "C",
  "D",
  "F"
];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: Text('HomePage')),

    body:  SafeArea(
      child: Padding(

        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('My Orders',
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold),
            ),
            ),
            SizedBox(height: 30,),
            Container(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  buildTab("Ordenes"),
                  buildTab("Pendientes"),

                ]
              ),
            ),
            Flexible(
              child: ListView(
                
                scrollDirection: Axis.vertical,
                children: [
                  buildTab("Ordenes"),
                   buildTab("Ordenes"),
                  buildTab("Pendientes"),

                ]
              ),
            ),
          
          ],
        ),
      )
    ));
  }
}