import 'package:flutter/material.dart';
import 'package:health_care/src/widget/custom_header.dart';
import 'package:health_care/src/widget/appointment_card.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        CustomHeader('Thông tin lịch khám'),
        Expanded(
            child: ListView(
          children: [
            AppointmentCard(
              title: 'PK HAPPY CARE',
              address: '30 Lâm Văn Bền, P Tân Kiểng, Q7',
              doctorName: 'CKII. Nguyễn Tuấn Phong',
              dateTime: '11:50 - 10/02/2023',
              code: '4F450TY',
              appointment: true,
            ),
            AppointmentCard(
              title: 'PK HAPPY CARE',
              address: '30 Lâm Văn Bền, P Tân Kiểng, Q7',
              doctorName: 'CKII. Nguyễn Tuấn Phong',
              dateTime: '11:50 - 10/02/2023',
              code: '4F450TY',
              appointment: true,
            ),
            AppointmentCard(
              title: 'PK HAPPY CARE',
              address: '30 Lâm Văn Bền, P Tân Kiểng, Q7',
              doctorName: 'CKII. Nguyễn Tuấn Phong',
              dateTime: '11:50 - 10/02/2023',
              code: '4F450TY',
              appointment: true,
            ),
            AppointmentCard(
              title: 'PK HAPPY CARE',
              address: '30 Lâm Văn Bền, P Tân Kiểng, Q7',
              doctorName: 'CKII. Nguyễn Tuấn Phong',
              dateTime: '11:50 - 10/02/2023',
              code: '4F450TY',
              appointment: true,
            ),
          ],
        ))
      ]),
    );
  }
}
