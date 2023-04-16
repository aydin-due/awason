class Order {
  String? id;
  dynamic clientId;
  dynamic carrierId;
  int? gallons;
  double? price;
  double? tax;
  double? total;
  String? orderStatus;
  String? deliveryStatus;
  DateTime? orderDate;
  DateTime? deliveryDate;

  Order({
    this.id,
    this.clientId,
    this.carrierId,
    this.gallons,
    this.price,
    this.tax,
    this.total,
    this.orderStatus,
    this.deliveryStatus,
    this.orderDate,
    this.deliveryDate,
  });

  Order.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    clientId = json["id_client"];
    carrierId = json["id_carrier"];
    gallons = json["cant_garrafones"];
    price = json["precio"] != null ? json["precio"] + 0.0 : null;
    tax = json["cuota_servicio"] != null ? json["cuota_servicio"] + 0.0 : null;
    total = json["total"] != null ? json["total"] + 0.0 : null;
    orderStatus = json["orden_status"];
    deliveryStatus = json["entrega_status"];
    orderDate = DateTime.tryParse(json["fecha_pedido"]);
    deliveryDate = DateTime.tryParse(json["fecha_entrega"] ?? "");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["client_id"] = clientId;
    data["carrier_id"] = carrierId;
    data["cant_garrafones"] = gallons;
    data["precio"] = price;
    data["cuota"] = tax;
    data["total"] = total;
    data["orden_status"] = orderStatus;
    data["entrega_status"] = deliveryStatus;
    data["fecha_pedido"] = orderDate;
    data["fecha_entrega"] = deliveryDate;

    return data;
  }
}
