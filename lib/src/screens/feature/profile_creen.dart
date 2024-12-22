import 'package:flutter/material.dart';
import 'package:health_care/src/widget/custom_profile.dart';

class ProfileCreen extends StatelessWidget {
  const ProfileCreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomProfile(
      name: 'Nguyễn Hữu Thiện', // Tên bác sĩ
      avatarPath: 'assets/images/ic_profile.png', // Đường dẫn avatar
      bodyContent: const ProfileBody(),
    );
  }
}

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSection(
          context,
          title: 'Thông tin',
          content: Column(
            children: [
              _buildInfoItem(
                context,
                icon: Icons.person_outline,
                title: 'Thông tin cá nhân',
                actionText: 'Chi tiết',
              ),
              _buildInfoItem(
                context,
                icon: Icons.health_and_safety_outlined,
                title: 'Thông tin sức khỏe',
                actionText: 'Chi tiết',
              ),
              _buildInfoItem(
                context,
                icon: Icons.folder_open_outlined,
                title: 'Hồ sơ khám chữa bệnh',
                actionText: 'Chi tiết',
              ),
              _buildInfoItem(
                context,
                icon: Icons.file_copy_outlined,
                title: 'Hồ sơ sức khỏe tổng quát',
                actionText: 'Chi tiết',
              ),
              _buildInfoItem(
                context,
                icon: Icons.vaccines_outlined,
                title: 'Hồ sơ tiêm chủng',
                actionText: 'Chưa có dữ liệu',
                isActionEnabled: false,
              ),
              _buildInfoItem(
                context,
                icon: Icons.favorite_border,
                title: 'Hồ sơ sức khỏe của tôi',
                actionText: 'Chưa có dữ liệu',
                isActionEnabled: false,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        _buildSection(
          context,
          title: 'Đã khám gần đây',
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'PK HAPPY CARE',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to detailed screen
                },
                child: const Text(
                  'Xem thêm',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSection(BuildContext context,
      {required String title, required Widget content}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              content,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String actionText,
    bool isActionEnabled = true,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 24, color: Colors.grey),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Text(
            actionText,
            style: TextStyle(
              fontSize: 16,
              color: isActionEnabled ? Colors.blue : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
