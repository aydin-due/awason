import 'package:awason/models/order.dart';

class OrderResponse {
  String? status;
  String? message;
  Order? data;

  OrderResponse({this.status, this.message, this.data});

  OrderResponse.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] != null ? Order.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["status"] = status;
    data["message"] = message;
    if (this.data != null) {
      data["data"] = this.data!.toJson();
    }

    return data;
  }
}
