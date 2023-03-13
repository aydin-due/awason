import 'package:awason/models/models.dart';

class CarrierResponse {
  String? status;
  String? message;
  Carrier? data;

  CarrierResponse({this.status, this.message, this.data});

  CarrierResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Carrier.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}