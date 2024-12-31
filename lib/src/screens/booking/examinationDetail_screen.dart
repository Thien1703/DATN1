import 'package:flutter/material.dart';
import 'package:health_care/src/widget/widget_Title/custom_header.dart';
import 'package:health_care/src/widget/custom_inforPatient.dart';
import 'package:health_care/src/model/patient.dart';

class ExaminationDetail extends StatelessWidget {
  const ExaminationDetail({super.key, required this.infoPatient});
  final InfoPatient infoPatient;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        CustomHeader('CHI TIẾT THĂM KHÁM'),
        CustomInforpatient(infoPatient: infoPatient)
      ],
    ));
  }
}
