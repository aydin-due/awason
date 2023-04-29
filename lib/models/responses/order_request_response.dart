import 'package:awason/models/models.dart';

class OrderRequestResponse {
  String? status;
  String? message;
  List<OrderRequest>? data;

  OrderRequestResponse({this.status, this.message, this.data});

  OrderRequestResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <OrderRequest>[];
      json['data'].forEach((v) {
        data!.add(OrderRequest.fromJson(v));
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

class OrderRequest {
  String? sId;
  Client? idClient;
  int? cantGarrafones;
  dynamic precio;
  int? cuotaServicio;
  dynamic total;
  String? ordenStatus;
  String? entregaStatus;
  String? fechaPedido;
  dynamic fechaEntrega;
  int? iV;

  OrderRequest(
      {this.sId,
      this.idClient,
      this.cantGarrafones,
      this.precio,
      this.cuotaServicio,
      this.total,
      this.ordenStatus,
      this.entregaStatus,
      this.fechaPedido,
      this.fechaEntrega,
      this.iV});

  OrderRequest.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    idClient = json['id_client'] != null
        ? Client.fromJson(json['id_client'])
        : null;
    cantGarrafones = json['cant_garrafones'];
    precio = json['precio'];
    cuotaServicio = json['cuota_servicio'];
    total = json['total'];
    ordenStatus = json['orden_status'];
    entregaStatus = json['entrega_status'];
    fechaPedido = json['fecha_pedido'];
    fechaEntrega = json['fecha_entrega'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (idClient != null) {
      data['id_client'] = idClient!.toJson();
    }
    data['cant_garrafones'] = cantGarrafones;
    data['precio'] = precio;
    data['cuota_servicio'] = cuotaServicio;
    data['total'] = total;
    data['orden_status'] = ordenStatus;
    data['entrega_status'] = entregaStatus;
    data['fecha_pedido'] = fechaPedido;
    data['fecha_entrega'] = fechaEntrega;
    data['__v'] = iV;
    return data;
  }
}