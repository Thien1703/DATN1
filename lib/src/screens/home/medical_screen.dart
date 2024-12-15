import 'package:flutter/material.dart';
import 'package:health_care/src/widget/appointment_card.dart';
import 'package:health_care/src/widget/custom_profile.dart';
import 'package:health_care/src/widget/feature_container.dart';

class MedicalScreen extends StatelessWidget {
  const MedicalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomProfile(
      name: 'Nguyễn Hữu Thiện', // Tên bác sĩ
      avatarPath: 'assets/images/ic_profile.png', // Đường dẫn avatar
      bodyContent: _buildBodyContent(),
    );
  }

  // Tạo phần body với GridView
  Widget _buildBodyContent() {
    return Column(
      children: [
        FeatureContainer(
          features: [
            {
              'icon': Icons.schedule,
              'title': 'Lịch khám',
              'onTap': () {
                print('Lịch khám được nhấn');
              }
            },
            {
              'icon': Icons.medical_services,
              'title': 'Thăm khám',
              'onTap': () {
                print('Thăm khám được nhấn');
              }
            },
            {
              'icon': Icons.local_hospital,
              'title': 'Cơ sở khám',
              'onTap': () {
                print('Cơ sở khám được nhấn');
              }
            },
            {
              'icon': Icons.attach_money,
              'title': 'Doanh thu',
              'onTap': () {
                print('Doanh thu được nhấn');
              }
            },
            {
              'icon': Icons.settings,
              'title': 'Cấu hình',
              'onTap': () {
                print('Cấu hình được nhấn');
              }
            },
            {
              'icon': Icons.person,
              'title': 'Tài khoản',
              'onTap': () {
                print('Tài khoản được nhấn');
              }
            },
          ],
        ),Padding(
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
        ),
      ],
    );
  }
}
