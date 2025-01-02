import 'package:flutter/material.dart';
import 'package:health_care/src/widget/widget_Title/custom_header.dart';
import 'package:health_care/src/widget/custom_cardForm.dart';
import 'package:health_care/src/model/inFor_userBooking.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final List<InfoBooking> dataCung = [
      InfoBooking(
          nameHospital: 'Bệnh viện Trung Ương',
          image: 'image',
          ngayKham: '12/12/2024',
          gioDuKien: '09:00',
          gioDangKy: '09:00-12:00',
          benhNhan: 'Nguyễn Văn A',
          phone: '0123456789',
          status: 2),
      InfoBooking(
          nameHospital: 'Bệnh viện Đại học Y',
          image: 'image',
          ngayKham: '15/12/2024',
          gioDuKien: '10:00',
          gioDangKy: '09:00-12:00',
          benhNhan: 'Trần Thị B',
          phone: '0987654321',
          status: 1),
      InfoBooking(
          nameHospital: 'Bệnh viện Bạch Mai',
          image: 'image',
          ngayKham: '18/12/2024',
          gioDuKien: '14:00',
          gioDangKy: '19:00 - 12:00',
          benhNhan: 'Lê Văn C',
          phone: '0912345678',
          status: 1),
      InfoBooking(
          nameHospital: 'Bệnh viện Bạch Mai',
          image: 'image',
          ngayKham: '18/12/2024',
          gioDuKien: '14:00',
          gioDangKy: '19:00 - 12:00',
          benhNhan: 'Lê Văn C',
          phone: '0912345678',
          status: 3),
      InfoBooking(
          nameHospital: 'Bệnh viện Bạch Mai',
          image: 'image',
          ngayKham: '18/12/2024',
          gioDuKien: '14:00',
          gioDangKy: '19:00 - 12:00',
          benhNhan: 'Lê Văn C',
          phone: '0912345678',
          status: 2),
      InfoBooking(
          nameHospital: 'Bệnh viện Bạch Mai',
          image: 'image',
          ngayKham: '18/12/2024',
          gioDuKien: '14:00',
          gioDangKy: '19:00 - 12:00',
          benhNhan: 'Lê Văn C',
          phone: '0912345678',
          status: 2),
    ];
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 228, 228),
      body: Column(children: [
        CustomHeader('Thông tin lịch khám'),
        Expanded(
            child: ListView.builder(
                itemCount: dataCung.length,
                itemBuilder: (context, index) {
                  return CustomCardform(
                    infoBooking: dataCung[index],
                  );
                })),
        SizedBox(height: 10),
      ]),
    );
  }
}
