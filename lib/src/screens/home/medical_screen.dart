import 'package:flutter/material.dart';
import 'package:health_care/src/widget/feature_card.dart';

class MedicalScreen extends StatelessWidget {
  MedicalScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> features = [
    {'icon': Icons.schedule, 'title': 'Lịch khám', 'onTap': 'Lịch khám'},
    {'icon': Icons.medical_services, 'title': 'Thăm khám', 'onTap': 'Thăm khám'},
    {'icon': Icons.local_hospital, 'title': 'Cơ sở khám', 'onTap': 'Cơ sở khám'},
    {'icon': Icons.attach_money, 'title': 'Doanh thu', 'onTap': 'Doanh thu'},
    {'icon': Icons.settings, 'title': 'Cấu hình', 'onTap': 'Cấu hình'},
    {'icon': Icons.person, 'title': 'Tài khoản', 'onTap': 'Tài khoản'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header Section
        Stack(
          children: [
            Container(
              height: 180,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 23, 128, 67), // Nhạt hơn (White)
                    Colors.green, // Đậm hơn (Green)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 40,
                    left: 60,
                    child: Icon(
                      Icons.circle,
                      size: 50,
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 40,
                    child: Icon(
                      Icons.circle,
                      size: 70,
                      color: Colors.white.withOpacity(0.1),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 30,
                    child: Icon(
                      Icons.circle,
                      size: 40,
                      color: Colors.white.withOpacity(0.15),
                    ),
                  ),
                  // Avatar and Name Section
                  Positioned(
                    top: 50,
                    left: 16,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage('https://www.example.com/avatar.jpg'), // Replace with your avatar URL or asset
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'John Doe', // Replace with actual name
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'Admin', // Replace with role or other info
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),

        // Features Section
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                    print(feature['onTap']);
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
