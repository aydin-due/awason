import 'package:awason/models/models.dart';

class IdClient {
  Direccion? direccion;
  Horario? horario;
  String? sId;
  String? nombre;
  String? apellidos;
  String? email;
  String? contrasena;
  int? numContacto;
  double? calificacion;
  int? iV;

  IdClient(
      {this.direccion,
      this.horario,
      this.sId,
      this.nombre,
      this.apellidos,
      this.email,
      this.contrasena,
      this.numContacto,
      this.calificacion,
      this.iV});

  IdClient.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}