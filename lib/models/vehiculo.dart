class Vehiculo {
  String? matricula;
  int? idTransp;
  String? marca;
  String? modelo;
  int? aO;
  String? color;

  Vehiculo(
      {this.matricula,
      this.idTransp,
      this.marca,
      this.modelo,
      this.aO,
      this.color});

  Vehiculo.fromJson(Map<String, dynamic> json) {
    matricula = json['matricula'];
    idTransp = json['id_transp'];
    marca = json['marca'];
    modelo = json['modelo'];
    aO = json['año'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['matricula'] = matricula;
    data['id_transp'] = idTransp;
    data['marca'] = marca;
    data['modelo'] = modelo;
    data['año'] = aO;
    data['color'] = color;
    return data;
  }
}