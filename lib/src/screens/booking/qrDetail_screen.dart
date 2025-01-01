import 'package:flutter/material.dart';
import 'package:health_care/src/widget/widget_Title/custom_header.dart';
import 'package:health_care/src/widget/custom_qrDetail.dart';
import 'package:health_care/src/model/inFor_userBooking.dart';

class QrdetailScreen extends StatelessWidget {
  const QrdetailScreen({super.key, required this.infoBooking});
  final InfoBooking infoBooking;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 239, 239),
      body: Column(
        children: [
          CustomHeader('PHIẾU KHÁM'),
          Expanded(
              child: ListView(
            children: [
              CustomQrdetail(
                infoBooking: infoBooking,
              ),
            ],
          )),
          InkWell(
            onTap: () {
              print('object');
            },
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Colors.red, width: 1)),
              child: Text(
                'Hủy lịch',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.red),
              ),
            ),
          )
        ],
      ),
    );
  }
}
