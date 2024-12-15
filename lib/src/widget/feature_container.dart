import 'package:flutter/material.dart';

// Widget chứa các tính năng
class FeatureContainer extends StatelessWidget {
  final List<Map<String, dynamic>> features;

  const FeatureContainer({
    super.key,
    required this.features,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 3 cột
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemCount: features.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: features[index]['onTap'], // Gọi hàm onTap khi click
            child: _FeatureItem(
              icon: features[index]['icon'],
              title: features[index]['title'],
            ),
          );
        },
      ),
    );
  }
}

// Widget cho từng item tính năng
class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const _FeatureItem({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.green, width: 2.0),
          ),
          child: Icon(icon, color: Colors.green, size: 32),
        ),
        const SizedBox(height: 8.0),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
