import 'package:flutter/material.dart';
import 'package:health_care/src/screens/booking/examinationDetail_screen.dart';
import 'package:health_care/src/model/patient.dart';

class CustomInforProfile extends StatefulWidget {
  const CustomInforProfile({super.key, required this.infoPatient});
  final InfoPatient infoPatient;
  @override
  State<CustomInforProfile> createState() {
    return _CustomInforProfile();
  }
}

class _CustomInforProfile extends State<CustomInforProfile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ExaminationDetail(infoPatient: widget.infoPatient),
          ),
        );
      },
      child: Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFFD9D9D9), width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Column(children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 5),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 228, 225, 225),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Text(widget.infoPatient.nameHospital,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF4CAF50)))),
          const SizedBox(height: 10),
          Row(children: [
            Container(
                margin: const EdgeInsets.only(left: 2),
                child: Image.asset('assets/images/ic_doctor.png')),
            Text(widget.infoPatient.nameDoctor,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF4CAF50),
                ))
          ]),
          const SizedBox(
            height: 10,
          ),
          Row(children: [
            Container(
                margin: const EdgeInsets.only(left: 5),
                child: Image.asset('assets/images/ic_calendar.png')),
            Text(widget.infoPatient.calender,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF9A9A9A),
                ))
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [
              Image.asset('assets/images/ic_medicine.png'),
              Text(widget.infoPatient.medicine,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF4CAF50),
                  ))
            ]),
            if (widget.infoPatient.date.isNotEmpty)
              Row(children: [
                Image.asset('assets/images/ic_schedule.png'),
                Text(widget.infoPatient.date,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF4CAF50),
                    ))
              ])
          ]),
          Row(children: [
            Image.asset('assets/images/ic_examination.png'),
            Text(widget.infoPatient.examination,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFFF0000),
                ))
          ])
        ]),
      ),
    );
  }
}
