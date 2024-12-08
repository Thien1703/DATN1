import 'package:flutter/material.dart';
import 'package:health_care/src/widget/custom_profile.dart';

class MedicalScreen extends StatelessWidget {
  const MedicalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomProfile(
      name: 'Nguyễn Hữu Thiện', // Tên bác sĩ
      avatarPath: 'assets/images/ic_profile.png', // Đường dẫn avatar
      bodyContent: Center(child: Text('Nội dung chính của màn hình')), // Nội dung chính của body
    );
  }
}