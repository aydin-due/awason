class Client {
  String? id;
  String? name;
  String? surname;
  String? email;
  String? password;
  int? phone;
  Address? address;
  Schedule? schedule;

  Client({
    this.id,
    this.name,
    this.surname,
    this.email,
    this.password,
    this.phone,
    this.address,
    this.schedule,
  });

  Client.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    name = json["nombre"];
    surname = json["apellidos"];
    email = json["email"];
    password = json["contrasena"];
    phone = json["num_contacto"];
    address =
        json["direccion"] != null ? Address.fromJson(json["direccion"]) : null;
    schedule =
        json["horario"] != null ? Schedule.fromJson(json["horario"]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["nombre"] = name;
    data["apellidos"] = surname;
    data["email"] = email;
    data["contrasena"] = password;
    data["num_contacto"] = phone;
    data["direccion"] = address != null ? address!.toJson() : null;
    data["horario"] = schedule != null ? schedule!.toJson() : null;

    return data;
  }
}

class Address {
  String? street;
  int? houseNumber;
  String? city;
  String? suburb;
  int? postal;

  Address({
    this.street,
    this.houseNumber,
    this.city,
    this.suburb,
    this.postal,
  });

  Address.fromJson(Map<String, dynamic> json) {
    street = json["calle"];
    houseNumber = json["numero"];
    city = json["ciudad"];
    suburb = json["colonia"];
    postal = json["codigo_postal"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data["calle"] = street;
    data["numero"] = houseNumber;
    data["ciudad"] = city;
    data["colonia"] = suburb;
    data["codigo_postal"] = postal;

    return data;
  }
}

class Schedule {
  List<int>? days;
  int? startingTime;
  int? endingTime;

  Schedule({this.days, this.startingTime, this.endingTime});

  Schedule.fromJson(Map<String, dynamic> json) {
    days = (json["dias"] as List<dynamic>).map((item) => item as int).toList();
    startingTime = json["hora_inicial"];
    endingTime = json["hora_final"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data["dias"] = days;
    data["hora_inicial"] = startingTime;
    data["hora_final"] = endingTime;

    return data;
  }
}
