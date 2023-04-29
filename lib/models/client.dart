import 'package:awason/models/models.dart';

class Client {
  Direccion? direccion;
  Horario? horario;
  String? sId;
  String? nombre;
  String? apellidos;
  String? email;
  String? contrasena;
  int? numContacto;
  dynamic calificacion;
  int? iV;
  List<Review>? reviews;

  Client(
      {this.direccion,
      this.horario,
      this.sId,
      this.nombre,
      this.apellidos,
      this.email,
      this.contrasena,
      this.numContacto,
      this.calificacion,
      this.reviews,
      this.iV});

  Client.fromJson(Map<String, dynamic> json) {
    direccion = json['direccion'] != null
        ? Direccion.fromJson(json['direccion'])
        : null;
    horario =
        json['horario'] != null ? Horario.fromJson(json['horario']) : null;
    sId = json['_id'];
    nombre = json['nombre'];
    apellidos = json['apellidos'];
    email = json['email'];
    contrasena = json['contrasena'];
    numContacto = json['num_contacto'];
    calificacion = json['calificacion'];
    iV = json['__v'];
    if (json['reseña'] != null) {
      reviews = <Review>[];
      json['reseña'].forEach((v) {
        reviews!.add(Review.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (direccion != null) {
      data['direccion'] = direccion!.toJson();
    }
    if (horario != null) {
      data['horario'] = horario!.toJson();
    }
    data['_id'] = sId;
    data['nombre'] = nombre;
    data['apellidos'] = apellidos;
    data['email'] = email;
    data['contrasena'] = contrasena;
    data['num_contacto'] = numContacto;
    data['calificacion'] = calificacion;
    data['__v'] = iV;
    if (reviews != null) {
      data['reseña'] = reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}