import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:health_care/src/model/inFor_userBooking.dart';

class CustomQrdetail extends StatelessWidget {
  const CustomQrdetail({super.key, required this.infoBooking});
  final InfoBooking infoBooking;
  @override
  Widget build(BuildContext context) {
    String qrData = '''
      Mã phiếu khám: ${infoBooking.nameHospital}
      Mã bệnh viện: ${infoBooking.image}
      Ngày khám: ${infoBooking.ngayKham}
      Giờ khám dự kiến: ${infoBooking.gioDuKien}
      Giờ đăng ký khám: ${infoBooking.gioDangKy}
      Bệnh nhân: ${infoBooking.benhNhan}
      Số điện thoại: ${infoBooking.phone}
''';
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Text(
                infoBooking.nameHospital,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        'STT',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '1',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      )
                    ],
                  ),
                  QrImageView(
                    data: qrData,
                    version: QrVersions.auto,
                    size: 100,
                  )
                ],
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 163, 241, 149),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Text(
                  'Đã đặt lịch',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 1, 105, 3),
                      fontWeight: FontWeight.w600,
                      fontSize: 12),
                ),
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
        customDashedLine(),
        Container(
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
          ),
          child: Column(
            children: [
              customContainerRow(
                  text1: 'Mã phiếu khám', text2: 'YMA24212270986'),
              SizedBox(height: 10),
              customContainerRow(
                  text1: 'Ngày khám', text2: infoBooking.ngayKham),
              SizedBox(height: 10),
              customContainerRow(
                  text1: 'Giờ đăng ký khám',
                  text2: '${infoBooking.gioDangKy} (Buổi sáng)'),
              SizedBox(height: 10),
              customContainerRow(
                  text1: 'Giờ khám dự kiến', text2: infoBooking.gioDuKien),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, top: 15, bottom: 15),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Thông tin bệnh nhân',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
          ),
          child: Column(
            children: [
              customContainerRow(text1: 'Mã bệnh nhân', text2: 'YMP242046970'),
              SizedBox(height: 10),
              customContainerRow(
                  text1: 'Họ và tên', text2: infoBooking.benhNhan),
              SizedBox(height: 10),
              customContainerRow(
                  text1: 'Số điện thoại', text2: infoBooking.phone),
              SizedBox(height: 20),
            ],
          ),
        ),
        customDashedLine(),
        Container(
          alignment: Alignment.topCenter,
          width: double.infinity,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
          ),
          child: InkWell(
            onTap: () {
              print('object');
            },
            child: Text('Chi tiết',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 4, 96, 172))),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Thông tin bệnh nhân',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
          ),
          child: Column(
            children: [
              SizedBox(height: 10),
              customContainerRow(
                  text1: infoBooking.nameHospital, text2: infoBooking.image),
              SizedBox(height: 10),
            ],
          ),
        ),
        SizedBox(height: 20),
        Column(
          children: [
            Text(
              'Tổng đài hộ trợ chăm sóc khách hàng',
              style: TextStyle(fontSize: 12.5),
            ),
            Text(
              '1900-2805',
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
        SizedBox(height: 20)
      ],
    );
  }
}

Widget customContainerRow({required String text1, required String text2}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text1,
        style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: const Color.fromARGB(255, 80, 80, 80)),
      ),
      Text(
        text2,
        style: TextStyle(
            fontSize: 13.5, fontWeight: FontWeight.w500, color: Colors.black),
      ),
    ],
  );
}

//gạch_đứt
class customDashedLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          90,
          (index) => Container(
            width: 4,
            height: 1,
            color: index % 2 == 0
                ? const Color.fromARGB(255, 137, 137, 137)
                : null,
          ),
        ),
      ),
    );
  }
}
