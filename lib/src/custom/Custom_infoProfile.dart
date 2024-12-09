import 'package:flutter/material.dart';

class CustomInforProfile extends StatefulWidget {
  const CustomInforProfile({super.key});
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
            border: Border.all(color: const Color(0xFFD9D9D9), width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 5),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 228, 225, 225),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: const Text('PK HAPPY CARE',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF4CAF50)))),
          const SizedBox(height: 10),
          Row(children: [
            Container(
                margin: const EdgeInsets.only(left: 2),
                child: Image.asset('assets/images/ic_doctor.png')),
            const Text('CKII. Nguyễn Tuấn Phong',
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
            const Text('11:50 - 10/02/2023',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF9A9A9A),
                ))
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [
              Image.asset('assets/images/ic_medicine.png'),
              const Text('5 ngày thuốc',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF4CAF50),
                  ))
            ]),
            Row(children: [
              Image.asset('assets/images/ic_schedule.png'),
              const Text('15/02/2023',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF4CAF50),
                  ))
            ])
          ]),
          Row(children: [
            Image.asset('assets/images/ic_examination.png'),
            const Text('Tái khám 15/02/2023',
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
