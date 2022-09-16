import 'package:flutter/material.dart';
import 'package:track_my_order_app/app/data/model/shipmentDropLines.dart';
import 'package:track_my_order_app/app/data/model/shiptmentDrop.dart';

class ShiptmentDropDetail extends StatelessWidget{

   List<ShiptmentDropLinesModel> _dropsLines = [];
   ShipmentDropModel _shipmentDropModel = ShipmentDropModel();

  ShiptmentDropDetail(ShipmentDropModel shipmentDropModel,List<ShiptmentDropLinesModel> dropsLines, {Key? key}) : super(key: key)
  {
    _dropsLines = dropsLines;
    _shipmentDropModel = shipmentDropModel;
  }
  @override
  Widget build(BuildContext context) {
    
    return Flexible(
      child: ListView(
        children: [Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [  
              Text('Invoice #${_shipmentDropModel.orderNumber}',
              style: const TextStyle(fontSize: 20,
              fontWeight: FontWeight.bold),),

            const  SizedBox(height: 10,),
              Text('${_shipmentDropModel.name}',
              style: const TextStyle(
              fontSize: 16,
              color: Colors.blueGrey),),
              const SizedBox(height: 10,),
             const  Divider(),
            
             Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  const[
                         Text('UM',
                         textAlign: TextAlign.justify,
                         style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 16,
                        )),
                        Text('Order',
                        style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        )),
                         Text('Delivery',
                         style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 16,
                        )),
            ]),
             ),
             const SizedBox(height: 20,),
                Column(
                children: _dropsLines.asMap().map((index,e) => MapEntry(index, buildLines(index + 1,e))).values.toList()
              ),
                const SizedBox(height: 10,),

          
              const SizedBox(height: 10,),
            
              
            ],
          ),
        ),
      ]),
    );

  }

  Widget buildLines(int index, ShiptmentDropLinesModel shiptmentDropLinesModel)
  {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         FittedBox (
                    child: Text('${shiptmentDropLinesModel.description}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),),
                  ),
                    const    SizedBox(height: 20,),
          Padding(
            
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children: [
            
                         Text('${shiptmentDropLinesModel.productErpId }',
                          textAlign: TextAlign.start,
                         style: const TextStyle(
                         fontSize: 16,
                        )),
                        Text('${shiptmentDropLinesModel.qty}',
                         textAlign: TextAlign.start,
                        style: const TextStyle(
                        fontSize: 16,
                        )),
                         Text('${shiptmentDropLinesModel.qty}',
                         textAlign: TextAlign.start ,
                         style: const TextStyle(
                         fontSize: 16,
                        )),
                          
                // Column(

                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [

                //     Expanded(
                //             child:   Text('${shiptmentDropLinesModel.description}',
                //        style: TextStyle(
                //         fontSize: 16,
                //        ),),
                //             flex: 85,
                //           ),
                //           Spacer(
                //             flex: 5,
                //           ),
                //           Expanded(
                //             child:  Text('${shiptmentDropLinesModel.qty}'),
                //             flex: 10,
                //           ),
                      
                       
                //   ],
                // ),
              // const  SizedBox(width: 5,),
              //   Text('${shiptmentDropLinesModel.qty}'),
              //  const  SizedBox(height: 10,)
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }

}