import 'package:awason/models/models.dart';

class Carrier {
  Vehiculo? vehiculo;
  String? sId;
  bool? isActive;
  dynamic balance;
  String? contrasena;
  int? iV;
  String? apellidos;
  String? email;
  String? nombre;
  int? numContacto;
  dynamic precioGarrafon;
  dynamic calificacion;

  Carrier(
      {this.vehiculo,
      this.sId,
      this.isActive,
      this.balance,
      this.contrasena,
      this.iV,
      this.apellidos,
      this.email,
      this.nombre,
      this.numContacto,
      this.precioGarrafon,
      this.calificacion});

  Carrier.fromJson(Map<String, dynamic> json) {
    vehiculo = json['vehiculo'] != null
        ? Vehiculo.fromJson(json['vehiculo'])
        : null;
    sId = json['_id'];
    isActive = json['isActive'];
    balance = json['balance'];
    contrasena = json['contrasena'];
    iV = json['__v'];
    apellidos = json['apellidos'];
    email = json['email'];
    nombre = json['nombre'];
    numContacto = json['num_contacto'];
    precioGarrafon = json['precioGarrafon'];
    calificacion = json['calificacion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (vehiculo != null) {
      data['vehiculo'] = vehiculo!.toJson();
    }
    data['_id'] = sId;
    data['isActive'] = isActive;
    data['balance'] = balance;
    data['contrasena'] = contrasena;
    data['__v'] = iV;
    data['apellidos'] = apellidos;
    data['email'] = email;
    data['nombre'] = nombre;
    data['num_contacto'] = numContacto;
    data['precioGarrafon'] = precioGarrafon;
    data['calificacion'] = calificacion;
    return data;
  }
}
