import 'package:flutter/material.dart';
import 'package:health_care/src/model/patient.dart';

class CustomInforpatient extends StatelessWidget {
  const CustomInforpatient({super.key, required this.infoPatient});
  final InfoPatient infoPatient;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 228, 225, 225),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Center(
                child: Text(infoPatient.nameHospital,
                    style: TextStyle(
                        color: Color(0xFF4CAF50),
                        fontSize: 16,
                        fontWeight: FontWeight.w700))),
          ),
          customBorderColumn(title: 'Thăm khám', children: [
            Row(children: [
              Image.asset('assets/images/ic_doctor.png'),
              Text(infoPatient.nameDoctor,
                  style: TextStyle(
                      color: Color(0xFF4CAF50),
                      fontSize: 14,
                      fontWeight: FontWeight.w700)),
            ]),
            Padding(
                padding: EdgeInsets.only(left: 3, top: 5, bottom: 5),
                child: Row(children: [
                  Image.asset('assets/images/ic_calendar.png'),
                  Text(infoPatient.calender,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF9A9A9A))),
                ])),
            Row(children: [
              Image.asset('assets/images/ic_doctor.png'),
              Text('ĐỖ HỒNG PHÚC',
                  style: TextStyle(
                      color: Color(0xFF4CAF50),
                      fontSize: 14,
                      fontWeight: FontWeight.w700)),
              SizedBox(width: 40),
              Text('6 tuổi',
                  style: TextStyle(
                      color: Color(0xFF4CAF50),
                      fontSize: 14,
                      fontWeight: FontWeight.w700))
            ]),
          ]),
          customBorderColumn(title: 'Chỉ số dấu hiệu sinh tồn', children: [
            Row(
              children: [
                Text('Nhiệt độ: ',
                    style: TextStyle(
                        color: Color(0xFFACACAC),
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
                SizedBox(width: 120),
                Text('Mạch: ',
                    style: TextStyle(
                        color: Color(0xFFACACAC),
                        fontSize: 14,
                        fontWeight: FontWeight.w400))
              ],
            ),
            Row(children: [
              Text('Huyết áp: ',
                  style: TextStyle(
                      color: Color(0xFFACACAC),
                      fontSize: 14,
                      fontWeight: FontWeight.w400)),
              SizedBox(width: 120),
              Text('Nhịp thở: ',
                  style: TextStyle(
                      color: Color(0xFFACACAC),
                      fontSize: 14,
                      fontWeight: FontWeight.w400))
            ])
          ]),
          customBorderColumn(title: 'Chuẩn đoán', children: [
            Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Text('- Viêm đường hô hấp trên',
                    style: TextStyle(
                        color: Color(0xFFACACAC),
                        fontSize: 14,
                        fontWeight: FontWeight.w400)))
          ]),
          customBorderColumn(title: 'Đơn thuốc', children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Số ngày thuốc : ',
                    style: TextStyle(
                        color: Color(0xFF4CAF50),
                        fontSize: 16,
                        fontWeight: FontWeight.w700)),
                Text(infoPatient.medicine,
                    style: TextStyle(
                        color: Color(0xFFFF0000),
                        fontSize: 16,
                        fontWeight: FontWeight.w700)),
              ],
            )
          ]),
          customBorderColumn(title: 'Lời dặn', children: [
            Text(
                'Mặt đồ thoáng mát, theo dõi nhiệt độ thường xuyên, có các dấu hiệu bất thường đến cơ sở y tế gần nhất.',
                style: TextStyle(
                    color: Color(0xFFACACAC),
                    fontSize: 14,
                    fontWeight: FontWeight.w400))
          ]),
          customBorderRow(title: 'Tái khám', text: (infoPatient.date)),
          customBorderRow(title: 'Liên hệ', text: ('0909511768-BS. Phong'))
        ],
      ),
    );
  }
}

Widget customBorderColumn(
    {required String title, required List<Widget> children}) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.only(top: 10, left: 15, right: 15),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFD9D9D9)),
        borderRadius: BorderRadius.all(Radius.circular(15))),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Color(0xFF4CAF50),
              fontSize: 16,
              fontWeight: FontWeight.w700),
        ),
        ...children,
      ],
    ),
  );
}

Widget customBorderRow({required String title, required String text}) {
  return Container(
    margin: EdgeInsets.only(top: 10, left: 15, right: 15),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFD9D9D9)),
        borderRadius: BorderRadius.all(Radius.circular(15))),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Color(0xFF4CAF50),
              fontSize: 16,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(width: 50),
        Text(
          text,
          style: TextStyle(
              color: Color(0xFFFF0000),
              fontSize: 16,
              fontWeight: FontWeight.w700),
        )
      ],
    ),
  );
}
