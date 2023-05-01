class Review {
  dynamic calificacion;
  String? comentario;
  String? idCarrier;

  Review({this.calificacion, this.comentario, this.idCarrier});

  Review.fromJson(Map<String, dynamic> json) {
    calificacion = json['calificacion'];
    comentario = json['comentario'];
    idCarrier = json['id_carrier'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['calificacion'] = calificacion;
    data['comentario'] = comentario;
    data['id_carrier'] = idCarrier;
    return data;
  }
}