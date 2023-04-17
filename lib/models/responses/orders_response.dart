import 'package:awason/models/models.dart';

class OrdersResponse {
  String? status;
  String? message;
  List<Order>? data;

  OrdersResponse({this.status, this.message, this.data});

  OrdersResponse.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] != null
        ? (json["data"] as List).map((order) => Order.fromJson(order)).toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["status"] = status;
    data["message"] = message;
    if (this.data != null) {
      data["data"] = [...this.data!.map((order) => order.toJson())];
    }

    return data;
  }
}