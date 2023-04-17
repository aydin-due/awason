class Direccion {
  String? calle;
  int? numero;
  String? ciudad;
  int? codigoPostal;
  String? colonia;

  Direccion(
      {this.calle, this.numero, this.ciudad, this.codigoPostal, this.colonia});

  Direccion.fromJson(Map<String, dynamic> json) {
    calle = json['calle'];
    numero = json['numero'];
    ciudad = json['ciudad'];
    codigoPostal = json['codigo_postal'];
    colonia = json['colonia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['calle'] = calle;
    data['numero'] = numero;
    data['ciudad'] = ciudad;
    data['codigo_postal'] = codigoPostal;
    data['colonia'] = colonia;
    return data;
  }
}
