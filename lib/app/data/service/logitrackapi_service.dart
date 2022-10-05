import 'package:get/get.dart';
import 'package:track_my_order_app/app/data/model/shipmentDropLines.dart';
import 'package:track_my_order_app/app/data/model/shiptment.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:track_my_order_app/app/data/model/shiptmentDrop.dart';




class LogitrackApiService extends GetxService{

  String _api = ""; 
   
  Future<LogitrackApiService> init() async {
    return this;
  }

    Future<List<ShiptmentModel>> getShiptment(String customerNo)async {

        final response = await http
        .get(Uri.parse('$_api/OrderTrak/CustomerShipments/$customerNo'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return List<ShiptmentModel>.from(json.decode(response.body)
      .map((data) => ShiptmentModel.fromJson(data)));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load shipments ');
    }
  }
    Future<List<ShipmentDropModel>> getShiptmentDrop(String shipmentId,String customerNo) async {

        final response = await http
        .get(Uri.parse('$_api/OrderTrak/ShipmentDrops/$shipmentId/$customerNo'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return List<ShipmentDropModel>.from(json.decode(response.body)
      .map((data) => ShipmentDropModel.fromJson(data)));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Drop ');
    }
  }
      Future<List<ShiptmentDropLinesModel>> getShiptmentDropLines(String dropId)async {

        final response = await http
        .get(Uri.parse('$_api/OrderTrak/ShipmentDropLines/$dropId'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return List<ShiptmentDropLinesModel>.from(json.decode(response.body)
      .map((data) => ShiptmentDropLinesModel.fromJson(data)));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Lines ');
    }
  }
}
