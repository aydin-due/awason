class Horario {
  List<int>? dias;
  int? horaInicial;
  int? horaFinal;

  Horario({this.dias, this.horaInicial, this.horaFinal});

  Horario.fromJson(Map<String, dynamic> json) {
    dias = json['dias'].cast<int>();
    horaInicial = json['hora_inicial'];
    horaFinal = json['hora_final'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dias'] = dias;
    data['hora_inicial'] = horaInicial;
    data['hora_final'] = horaFinal;
    return data;
  }
}
