class Balance {
  dynamic total;
  dynamic servicio;
  dynamic ganancias;

  Balance({this.total, this.servicio, this.ganancias});

  Balance.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    servicio = json['servicio'];
    ganancias = json['ganancias'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['servicio'] = servicio;
    data['ganancias'] = ganancias;
    return data;
  }
}