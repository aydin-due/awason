import 'package:awason/models/models.dart';

class Carrier {
  Vehiculo? vehiculo;
  String? sId;
  bool? isActive;
  Balance? balance;
  String? contrasena;
  int? iV;
  String? apellidos;
  String? email;
  String? nombre;
  int? numContacto;
  dynamic precioGarrafon;
  dynamic calificacion;
  List<Review>? reviews;

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
      this.reviews,
      this.calificacion});

  Carrier.fromJson(Map<String, dynamic> json) {
    vehiculo = json['vehiculo'] != null
        ? Vehiculo.fromJson(json['vehiculo'])
        : null;
    sId = json['_id'];
    isActive = json['isActive'];
     balance =json['balance'] != null ? Balance.fromJson(json['balance']) : null;
    contrasena = json['contrasena'];
    iV = json['__v'];
    apellidos = json['apellidos'];
    email = json['email'];
    nombre = json['nombre'];
    numContacto = json['num_contacto'];
    precioGarrafon = json['precioGarrafon'];
    calificacion = json['calificacion'];
     if (json['reseña'] != null) {
      reviews = <Review>[];
      json['reseña'].forEach((v) {
        reviews!.add(Review.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (vehiculo != null) {
      data['vehiculo'] = vehiculo!.toJson();
    }
    data['_id'] = sId;
    data['isActive'] = isActive;
    if (balance != null) {
      data['balance'] = balance!.toJson();
    }
    data['contrasena'] = contrasena;
    data['__v'] = iV;
    data['apellidos'] = apellidos;
    data['email'] = email;
    data['nombre'] = nombre;
    data['num_contacto'] = numContacto;
    data['precioGarrafon'] = precioGarrafon;
    data['calificacion'] = calificacion;
    if (reviews != null) {
      data['reseña'] = reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
