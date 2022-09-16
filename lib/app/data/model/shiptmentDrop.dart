
    import 'package:flutter/material.dart';

enum DropStatus
    {
    
        InRoute,
        Arrived,
        Complete,

    }

class ShipmentDropModel {



  int? shipmentNumber;
  int? shipmentDropId;
  String? orderNumber;
  String? orderErpId;
  bool? cashOnDelivery;
  int? deliveryOrder;
  String? customer;
  String? name;
  int? amount;
  String? startTime;
  String? deliveryEta;
  String? deliveryEtd;
  String? arrivedAt;
  String? dropStarted;
  String? dropEnded;
  int? dropStatus;
  String? invoiceNumber;
  String? signatureName;
  double? latitude;
  double? longitude;

 //DropStatus dropStatusEnum = DropStatus.InRoute;

  ShipmentDropModel(
      {this.shipmentNumber,
      this.shipmentDropId,
      this.orderNumber,
      this.orderErpId,
      this.cashOnDelivery,
      this.deliveryOrder,
      this.customer,
      this.name,
      this.amount,
      this.startTime,
      this.deliveryEta,
      this.deliveryEtd,
      this.arrivedAt,
      this.dropStarted,
      this.dropEnded,
      this.dropStatus,
      this.invoiceNumber,
      this.signatureName,
      this.latitude,
      this.longitude});

  ShipmentDropModel.fromJson(Map<String, dynamic> json) {
    shipmentNumber = json['shipmentNumber'];
    shipmentDropId = json['shipmentDropId'];
    orderNumber = json['orderNumber'];
    orderErpId = json['orderErpId'];
    cashOnDelivery = json['cashOnDelivery'];
    deliveryOrder = json['deliveryOrder'];
    customer = json['customer'];
    name = json['name'];
    amount = json['amount'];
    startTime = json['startTime'];
    deliveryEta = json['deliveryEta'];
    deliveryEtd = json['deliveryEtd'];
    arrivedAt = json['arrivedAt'];
    dropStarted = json['dropStarted'];
    dropEnded = json['dropEnded'];
    dropStatus = json['dropStatus'];
    invoiceNumber = json['invoiceNumber'];
    signatureName = json['signatureName'];
    latitude = json['latitude'];
    longitude = json['longitude'];


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shipmentNumber'] = this.shipmentNumber;
    data['shipmentDropId'] = this.shipmentDropId;
    data['orderNumber'] = this.orderNumber;
    data['orderErpId'] = this.orderErpId;
    data['cashOnDelivery'] = this.cashOnDelivery;
    data['deliveryOrder'] = this.deliveryOrder;
    data['customer'] = this.customer;
    data['name'] = this.name;
    data['amount'] = this.amount;
    data['startTime'] = this.startTime;
    data['deliveryEta'] = this.deliveryEta;
    data['deliveryEtd'] = this.deliveryEtd;
    data['arrivedAt'] = this.arrivedAt;
    data['dropStarted'] = this.dropStarted;
    data['dropEnded'] = this.dropEnded;
    data['dropStatus'] = this.dropStatus;
    data['invoiceNumber'] = this.invoiceNumber;
    data['signatureName'] = this.signatureName;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }

}
 
