import 'package:flutter/material.dart';
import 'package:health_care/src/widget/custom_header.dart';
import 'package:health_care/src/model/patient.dart';

class CustomInforpatient extends StatelessWidget {
  const CustomInforpatient({super.key, required this.infoPatient});
  final InfoPatient infoPatient;
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(horizontal: 90, vertical: 10),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 228, 225, 225),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Text('Bệnh viện: ${infoPatient.nameHospital}'),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 15, right: 15),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Column(
              children: [
                Text('Thăm khám'),
                Row(
                  children: [
                    Image.asset('assets/images/ic_doctor.png'),
                    Text(infoPatient.nameDoctor),
                  ],
                ),
                Row(
                  children: [
                    Image.asset('assets/images/ic_calendar.png'),
                    Text(infoPatient.calender),
                  ],
                ),
                Row(
                  children: [
                    Image.asset('assets/images/ic_doctor.png'),
                    Text('ĐỖ HỒNG PHÚC'),
                    Text('6 tuổi')
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 15, right: 15),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              children: [
                Text('Chỉ số dấu hiệu sinh tồn'),
                Row(
                  children: [Text('Nhiệt độ: '), Text('Mạch: ')],
                ),
                Row(
                  children: [Text('Huyết áp: '), Text('Nhịp thở: ')],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 15, right: 15),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              children: [Text('Chuẩn đoán'), Text('-Viêm đường hô hấp trên')],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 15, right: 15),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              children: [
                Text('Don thuoc'),
                Text(infoPatient.medicine),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 15, right: 15),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              children: [
                Text('Loi dan'),
                Text(
                    'Mặt đồ thoáng mát, theo dõi nhiệt độ thường xuyên, có các dấu hiệu bất thường đến cơ sở y tế gần nhất.')
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 15, right: 15),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Row(
              children: [
                Text('Tai kham'),
                if (infoPatient.date.isNotEmpty) Text(infoPatient.date),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 15, right: 15),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Row(
              children: [
                Text('Lien he'),
                Text('0909511768-BS. Phong'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
