import 'package:health_care/src/model/data_hospital.dart';

class BookingModel {
  String name;
  String phoneNumber;
  TimeWorking timeBooking;
  DateTime dateBooking;
  Doctor doctor;
  BookingModel(
      {required this.name,
      required this.phoneNumber,
      required this.timeBooking,
      required this.doctor,
      required this.dateBooking});
}
