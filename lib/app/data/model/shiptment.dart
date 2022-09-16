class ShiptmentModel {
  int? shipmentNumber;
  String? shipmentErpNumber;
  int? shipto;
  String? status;
  String? shipmentDate;
  int? deliveryOrder;
  int? amount;
  int? invoices;
  String? driver;
  String? truck;
 late final  DateTime eta;
  int? dropCount;
  int? completedDrops;
  String? customer;

  ShiptmentModel(
      {this.shipmentNumber,
      this.shipmentErpNumber,
      this.shipto,
      this.status,
      this.shipmentDate,
      this.deliveryOrder,
      this.amount,
      this.invoices,
      this.driver,
      this.truck,
      required this.eta,
      this.dropCount,
      this.completedDrops,
      this.customer});

  ShiptmentModel.fromJson(Map<dynamic, dynamic> json) {
    shipmentNumber = json['shipmentNumber'];
    shipmentErpNumber = json['shipmentErpNumber'];
    shipto = json['shipto'];
    status = json['status'];
    shipmentDate = json['shipmentDate'];
    deliveryOrder = json['deliveryOrder'];
    amount = json['amount'];
    invoices = json['invoices'];
    driver = json['driver'];
    truck = json['truck'];
    eta = DateTime.parse(json['eta']);
    dropCount = json['dropCount'];
    completedDrops = json['completedDrops'];
    customer = json['customer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shipmentNumber'] = this.shipmentNumber;
    data['shipmentErpNumber'] = this.shipmentErpNumber;
    data['shipto'] = this.shipto;
    data['status'] = this.status;
    data['shipmentDate'] = this.shipmentDate;
    data['deliveryOrder'] = this.deliveryOrder;
    data['amount'] = this.amount;
    data['invoices'] = this.invoices;
    data['driver'] = this.driver;
    data['truck'] = this.truck;
    data['eta'] = this.eta;
    data['dropCount'] = this.dropCount;
    data['completedDrops'] = this.completedDrops;
    data['customer'] = this.customer;
    return data;
  }
}