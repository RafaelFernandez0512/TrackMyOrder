class ShiptmentDropLinesModel {
  int? shipmentNumber;
  String? lineId;
  int? shipmentDrop;
  int? product;
  int? qty;
  String? code;
  String? productErpId;
  String? description;

  ShiptmentDropLinesModel(
      {this.shipmentNumber,
      this.lineId,
      this.shipmentDrop,
      this.product,
      this.qty,
      this.code,
      this.productErpId,
      this.description});

  ShiptmentDropLinesModel.fromJson(Map<String, dynamic> json) {
    shipmentNumber = json['shipmentNumber'];
    lineId = json['lineId'];
    shipmentDrop = json['shipmentDrop'];
    product = json['product'];
    qty = json['qty'];
    code = json['code'];
    productErpId = json['productErpId'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shipmentNumber'] = this.shipmentNumber;
    data['lineId'] = this.lineId;
    data['shipmentDrop'] = this.shipmentDrop;
    data['product'] = this.product;
    data['qty'] = this.qty;
    data['code'] = this.code;
    data['productErpId'] = this.productErpId;
    data['description'] = this.description;
    return data;
  }
}