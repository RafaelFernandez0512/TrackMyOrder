import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:track_my_order_app/app/ui/pages/track/widget/ProcessTimelinePage.dart';
import 'package:track_my_order_app/app/ui/pages/track/widget/shiptmentDropDetail_widget.dart';
import '../../../controllers/TrackOrderController.dart';
import '../../../data/model/shiptmentDrop.dart';



class TrackOrderPage extends GetView<TrackOrderController> {
  @override
  Widget build(BuildContext context) {
//     var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
//       DateTime parseDate =
//     new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(controller.currentShiptment!.eta!);

// var inputDate = DateTime.parse(parseDate.toString());
// var eta = outputFormat.format(inputDate);

//String formattedDateETA = DateFormat.yMMMEd().format(controller.currentShiptment?.eta);

    return GetBuilder<TrackOrderController>(
      builder: (_) {                  
        return  Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary:Color(0xFFba57ea) )
          ),
          
          child: SafeArea (
            child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: true ,
              title:  Row(
                  children: [
                    Image.asset('assets/itgWhiteLogo.png',fit: BoxFit.fitWidth,
                    width: 30,height: 30,),
                    SizedBox(width: 20,),
                    const  Center(child: Text("Track My Order ")),
                  ],
              ),
              actions:  <Widget>[
                 
                    IconButton(
                      onPressed: (() => controller.logout()), 
                      icon: const Icon(Icons.exit_to_app)),
              ],
            ),
               body: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: controller.currentShiptment==null?
                   Padding(
                     padding: const EdgeInsets.symmetric(vertical: 0),
                     child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/package.png'
                          ,height: 200,),
                         const SizedBox(height: 20,),
                          Text('No deliveries found in routes!',style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[500]

                          ),)
                        ],
                      ) ),
                   ):
                    Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                           const   SizedBox(height: 10,), 
                            Text('Shipment Number: ${controller.currentShiptment?.customer}',
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),),
                             const   SizedBox(height: 10,), 
                            Row(
                              children: [
                       
                                Expanded(
                                   flex: 48,
                                   child:  Text('Driver: ${controller.currentShiptment?.driver}',
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontSize: 16
                                ),),
                               ),
                       
                                 Expanded(
                                   flex: 48,
                                   child: Text('Truck: ${controller.currentShiptment?.truck}',
                                                             textAlign: TextAlign.start,
                                                             style: const TextStyle(
                                                               fontSize: 16
                                                             ),),
                                 ),
                              ],
                            ),
                          const   SizedBox(height: 10,),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             Expanded(
                                   flex: 48,
                                   child:  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Shipto: ${controller.currentShiptment?.shipto}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal
                                    ),),
                                    const SizedBox(height: 10,),
                                    Text('Invoices: ${controller.currentShiptment?.invoices}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal
                                    ),),
                                   const SizedBox(height: 10,),
                                   Text('ETA: ${DateFormat.yMd().add_jm().format(controller.currentShiptment!.eta)}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal
                                    ),),
                                    ],
                                   )
                               ),
                                Expanded(
                                   flex: 48,
                                   child:  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                     children: [
                                      const SizedBox(height: 5,),
                                      Row(
                                        children:  [
                                            IconButton(onPressed: () => controller.makePhoneCall(controller.currentShiptment?.shipmentErpNumber),
                                                      icon: const  Icon(Icons.phone,color: Colors.green,)),     
                                             const  SizedBox(width: 10,),          
                                            Text('${controller.currentShiptment?.shipmentErpNumber}',
                                            style: const  TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal
                                            ),),
                                        ],
                                      )
                                     ],
                                   ),
                                 ),
                            ],
                           ),
                         const   SizedBox(height: 10,),    
                          
                           const Divider(),
                           const    SizedBox(height: 2,),
                           SizedBox(
                            height: 100,
                            child: 
                            ProcessTimeline(
                              percentageValue: (controller.currentShiptment!.completedDrops!/(controller.currentShiptment!.deliveryOrder!)).toDouble() ,
                              processIndex: controller.dropStatus.index,
                              process: DropStatus.values.map((e) => e.name).toList(),
                              centerTitlePercentage: Text('${controller.currentShiptment?.completedDrops}/${controller.currentShiptment?.deliveryOrder}'),)),
                             const  SizedBox(height: 10,),
                             Padding(
                               padding: const EdgeInsets.all(10.0),
                               child: Center(
                                 child: Flexible(
                                    child: Obx(()=> controller.drops.isEmpty? const SizedBox():CustomSlidingSegmentedControl(
                                          children: { for (var element in controller.drops) 
                                                       controller.drops.indexOf(element).toString() : Text('# ${element.orderErpId}',
                                                                                                      style: TextStyle(
                                                                                                        color:  controller.currentDropIndex.value == controller.drops.indexOf(element)?Colors.white:Colors.black
                                                                                                      ),)
                                                    },
                                                    onValueChanged: (v){
                                                     controller.changeStep(int.parse(v.toString()));
                                                      //controller.changeStep(step)
                                                    },
                                                     duration: const Duration(milliseconds: 300),
                                                    curve: Curves.linearToEaseOut,                                  
                                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color.fromRGBO(229, 229, 233, 1)),
                                    
                                                    thumbDecoration: BoxDecoration(
                                                    color: Theme.of(context).primaryColor,
                                                    
                                                    borderRadius: BorderRadius.circular(10),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black.withOpacity(.3),
                                                        blurRadius: 4.0,
                                                        spreadRadius: 1.0,
                                                        offset: const Offset(
                                                          0.0,
                                                          2.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),),
                                    ),
                                  ),
                               ),
                             ),
                             
                           const SizedBox(height: 10,),
                            controller.obx((state){
                             return controller.lines.isEmpty ? const  SizedBox():ShiptmentDropDetail(controller.currentDrop,controller.lines);
                            },
                           // onLoading: Center(child: const CircularProgressIndicator(),) )
                            )
                          ],
                        ),
               ),
            
              ),
            ),
          
        );
      
  });
  }

}