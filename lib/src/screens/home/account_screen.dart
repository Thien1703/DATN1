import 'package:flutter/material.dart';
import 'package:health_care/src/widget/appointment_card.dart';
import 'package:health_care/src/widget/custom_profile.dart';
import 'package:health_care/src/widget/feature_container.dart';
import 'package:health_care/src/screens/booking/examination_screen.dart';
import 'package:health_care/src/screens/booking/schedule_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomProfile(
      name: 'Nguyễn Hữu Thiện', // Tên bác sĩ
      avatarPath: 'assets/images/ic_profile.png', // Đường dẫn avatar
      bodyContent: _buildBodyContent(context),
    );
  }

  // Tạo phần body với GridView
  Widget _buildBodyContent(BuildContext context) {
    return Column(
      children: [
        FeatureContainer(
          features: [
            {
              'icon': Icons.schedule,
              'title': 'Đến khám',
              'onTap': () {
                print('Đến khám được nhấn');
              }
            },
            {
              'icon': Icons.medical_services,
              'title': 'Lịch khám',
              'onTap': () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ScheduleScreen()));
              }
            },
            {
              'icon': Icons.local_hospital,
              'title': 'Thăm khám',
              'onTap': () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Examination()));
              }
            },
            {
              'icon': Icons.attach_money,
              'title': 'Đặt khám',
              'onTap': () {
                print('Đặt khám được nhấn');
              }
            },
            {
              'icon': Icons.settings,
              'title': 'Tài khoản',
              'onTap': () {
                print('Tài khoản được nhấn');
              }
            },
            {
              'icon': Icons.person,
              'title': 'Cấu hình',
              'onTap': () {
                print('Cấu hình được nhấn');
              }
            },
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            'Lịch khám của bạn',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ),
        AppointmentCard(
          title: 'PK HAPPY CARE',
          address: '30 Lâm Văn Bền, P Tân Kiểng, Q7',
          doctorName: 'Nguyễn Tuấn Phong',
          dateTime: '11:50 - 10/02/2023',
          code: '4F450TY',
          appointment: false,
        ),
      ],
    );
  }
}
