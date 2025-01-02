import 'package:flutter/material.dart';
import 'package:health_care/src/screens/booking/qrDetail_screen.dart';
import 'package:health_care/src/model/inFor_userBooking.dart';

class CustomCardform extends StatelessWidget {
  const CustomCardform({super.key, required this.infoBooking});
  final InfoBooking infoBooking;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => QrdetailScreen(
                      infoBooking: infoBooking,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(top: 0, right: 17, left: 17, bottom: 15),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: infoBooking.status == 1
                          ? const Color(0xFFA3F195)
                          : infoBooking.status == 2
                              ? const Color(0xFFF19595)
                              : infoBooking.status == 3
                                  ? const Color(0xFF95A1F1)
                                  : null,
                      borderRadius: BorderRadius.all(Radius.circular(7))),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          if (infoBooking.status == 1)
                            Image.asset(
                              'assets/images/ic_dot.png',
                              width: 10,
                            ),
                          if (infoBooking.status == 2)
                            Image.asset(
                              'assets/images/ic_dotRed.png',
                              width: 10,
                            ),
                          if (infoBooking.status == 3)
                            Image.asset(
                              'assets/images/ic_dotBlue.png',
                              width: 10,
                            ),
                        ],
                      ),
                      SizedBox(width: 5),
                      Column(
                        children: [
                          if (infoBooking.status == 1)
                            Text(
                              'Đã đặt lịch',
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 1, 105, 3),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                            ),
                          if (infoBooking.status == 2)
                            Text(
                              'Đã hủy',
                              style: TextStyle(
                                  color: const Color(0xFF860303),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                            ),
                          if (infoBooking.status == 3)
                            Text(
                              'Đã khám',
                              style: TextStyle(
                                  color: const Color(0xFF0F0169),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                            ),
                        ],
                      )
                    ],
                  )),
              Row(
                children: [
                  Text('STT '),
                  Text(
                    '1',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              )
            ]),
            SizedBox(height: 15),
            customCardformRow(
                textLeft: infoBooking.nameHospital,
                textRight: infoBooking.image),
            SizedBox(height: 15),
            customCardformRowText(
                textLeft: 'Giờ khám dự kiến',
                textRight:
                    '${infoBooking.gioDuKien} - ${infoBooking.ngayKham}'),
            customCardformRowText(
                textLeft: 'Giờ khám',
                textRight: '${infoBooking.gioDangKy}- ${infoBooking.ngayKham}'),
            customCardformRowText(
                textLeft: 'Bệnh nhân', textRight: infoBooking.benhNhan),
          ],
        ),
      ),
    );
  }
}

Widget customCardformRow(
    {required String textLeft, required String textRight}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        textLeft,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      Text(textRight),
    ],
  );
}

Widget customCardformRowText(
    {required String textLeft, required String textRight}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        textLeft,
        style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: const Color.fromARGB(255, 80, 80, 80)),
      ),
      Text(
        textRight,
        style: TextStyle(
            fontSize: 13.5, fontWeight: FontWeight.w500, color: Colors.black),
      ),
    ],
  );
}
