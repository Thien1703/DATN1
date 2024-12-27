// To parse this JSON data, do
//
//     final dataHospital = dataHospitalFromJson(jsonString);

import 'dart:convert';

DataHospital dataHospitalFromJson(String str) =>
    DataHospital.fromJson(json.decode(str));

String dataHospitalToJson(DataHospital data) => json.encode(data.toJson());

class DataHospital {
  String? hospital;
  String? special;
  String? mainDoctor;
  String? address;
  String? phone;
  List<String>? list;
  List<String>? listTime;
  List<Doctor>? listDoctor;

  DataHospital({
    this.hospital,
    this.special,
    this.mainDoctor,
    this.address,
    this.phone,
    this.list,
    this.listDoctor,
    this.listTime,
  });

  DataHospital copyWith({
    String? hospital,
    String? special,
    String? mainDoctor,
    String? address,
    String? phone,
    List<String>? list,
    List<Doctor>? listDoctor,
    List<String>? listTime,
  }) =>
      DataHospital(
        hospital: hospital ?? this.hospital,
        special: special ?? this.special,
        mainDoctor: mainDoctor ?? this.mainDoctor,
        address: address ?? this.address,
        phone: phone ?? this.phone,
        list: list ?? this.list,
        listDoctor: listDoctor ?? this.listDoctor,
        listTime: listTime ?? this.listTime,
      );

  factory DataHospital.fromJson(Map<String, dynamic> json) => DataHospital(
        hospital: json["hospital"],
        special: json["special"],
        mainDoctor: json["mainDoctor"],
        address: json["address"],
        phone: json["phone"],
        list: json["list"] == null
            ? []
            : List<String>.from(json["list"]!.map((x) => x)),
        listDoctor: json["listDoctor"] == null
            ? []
            : List<Doctor>.from(
                json["listDoctor"]!.map((x) => Doctor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "hospital": hospital,
        "special": special,
        "mainDoctor": mainDoctor,
        "address": address,
        "phone": phone,
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x)),
        "listDoctor": listDoctor == null
            ? []
            : List<dynamic>.from(listDoctor!.map((x) => x.toJson())),
      };
}

class Doctor {
  int? id;
  String? name;
  List<TimeWorking>? timeWorkingMorning;
  List<TimeWorking>? timeWorkingAfternoon;

  Doctor({
    this.id,
    this.name,
    this.timeWorkingMorning,
    this.timeWorkingAfternoon,
  });

  Doctor copyWith({
    int? id,
    String? name,
    List<TimeWorking>? timeWorkingMorning,
    List<TimeWorking>? timeWorkingAfternoon,
  }) =>
      Doctor(
        id: id ?? this.id,
        name: name ?? this.name,
        timeWorkingMorning: timeWorkingMorning ?? this.timeWorkingMorning,
        timeWorkingAfternoon: timeWorkingAfternoon ?? this.timeWorkingAfternoon,
      );

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["id"],
        name: json["name"],
        timeWorkingMorning: json["timeWorkingMorning"] == null
            ? []
            : List<TimeWorking>.from(json["timeWorkingMorning"]!
                .map((x) => TimeWorking.fromJson(x))),
        timeWorkingAfternoon: json["timeWorkingAfternoon"] == null
            ? []
            : List<TimeWorking>.from(json["timeWorkingAfternoon"]!
                .map((x) => TimeWorking.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "timeWorkingMorning": timeWorkingMorning == null
            ? []
            : List<dynamic>.from(timeWorkingMorning!.map((x) => x.toJson())),
        "timeWorkingAfternoon": timeWorkingAfternoon == null
            ? []
            : List<dynamic>.from(timeWorkingAfternoon!.map((x) => x.toJson())),
      };
}

class TimeWorking {
  String? time;
  bool? isBooking;

  TimeWorking({
    this.time,
    this.isBooking,
  });

  TimeWorking copyWith({
    String? time,
    bool? isBooking,
  }) =>
      TimeWorking(
        time: time ?? this.time,
        isBooking: isBooking ?? this.isBooking,
      );

  factory TimeWorking.fromJson(Map<String, dynamic> json) => TimeWorking(
        time: json["time"],
        isBooking: json["isBooking"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "isBooking": isBooking,
      };
}
