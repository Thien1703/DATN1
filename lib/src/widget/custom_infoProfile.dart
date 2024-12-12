import 'package:flutter/material.dart';

class CustomInforProfile extends StatefulWidget {
  const CustomInforProfile({
    super.key,
    required this.nameHospital,
    required this.nameDoctor,
    required this.calender,
    required this.medicine,
    required this.date,
    required this.examination,
  });
  final String nameHospital;
  final String nameDoctor;
  final String calender;
  final String medicine;
  final String date;
  final String examination;
  @override
  State<CustomInforProfile> createState() {
    return _CustomInforProfile();
  }
}

class _CustomInforProfile extends State<CustomInforProfile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFFD9D9D9), width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 5),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 228, 225, 225),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Text(widget.nameHospital,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF4CAF50)))),
          const SizedBox(height: 10),
          Row(children: [
            Container(
                margin: const EdgeInsets.only(left: 2),
                child: Image.asset('assets/images/ic_doctor.png')),
            Text(widget.nameDoctor,
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
            Text(widget.calender,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF9A9A9A),
                ))
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [
              Image.asset('assets/images/ic_medicine.png'),
              Text(widget.medicine,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF4CAF50),
                  ))
            ]),
            if (widget.date.isNotEmpty)
              Row(children: [
                Image.asset('assets/images/ic_schedule.png'),
                Text(widget.date,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF4CAF50),
                    ))
              ])
          ]),
          Row(children: [
            Image.asset('assets/images/ic_examination.png'),
            Text(widget.examination,
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
