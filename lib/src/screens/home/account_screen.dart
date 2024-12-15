import 'package:flutter/material.dart';
import 'package:health_care/src/screens/booking/examination_screen.dart';
import 'package:health_care/src/widget/custom_profile.dart';
import 'package:health_care/src/widget/feature_card.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

  final List<Map<String, dynamic>> features = [
    {'icon': Icons.schedule, 'title': 'Lịch khám', 'onTap': 'Lịch khám'},
    {
      'icon': Icons.medical_services,
      'title': 'Thăm khám',
      'onTap': 'Thăm khám'
    },
    {
      'icon': Icons.local_hospital,
      'title': 'Cơ sở khám',
      'onTap': 'Cơ sở khám'
    },
    {'icon': Icons.attach_money, 'title': 'Doanh thu', 'onTap': 'Doanh thu'},
    {'icon': Icons.settings, 'title': 'Cấu hình', 'onTap': 'Cấu hình'},
    {'icon': Icons.person, 'title': 'Tài khoản', 'onTap': 'Tài khoản'},
  ];

  @override
  Widget build(BuildContext context) {
    return CustomProfile(
      name: 'Nguyễn Hữu Thiện', // Tên bác sĩ
      avatarPath: 'assets/images/ic_profile.png', // Đường dẫn avatar
      bodyContent: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemCount: features.length, // Sử dụng list dynamic
          itemBuilder: (context, index) {
            var feature = features[index];
            return FeatureCard(
              icon: feature['icon'],
              title: feature['title'],
              onTap: () {
                print(feature['onTap']); // Tạo sự kiện khi nhấn vào từng item
                if (feature['onTap'] == 'Thăm khám') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Examination(),
                    ),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
