import 'package:awason/models/models.dart';

class CarriersResponse {
  String? status;
  String? message;
  List<Carrier>? data;

  CarriersResponse({this.status, this.message, this.data});

  CarriersResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Carrier>[];
      json['data'].forEach((v) {
        data!.add(Carrier.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}