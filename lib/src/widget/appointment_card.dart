import 'package:flutter/material.dart';

// Widget Lịch Khám
class AppointmentCard extends StatelessWidget {
  final String title; // Tên phòng khám
  final String address; // Địa chỉ phòng khám
  final String doctorName; // Tên bác sĩ
  final String dateTime; // Ngày và giờ khám
  final String code; // Mã số khám
  final bool appointment;

  const AppointmentCard({
    super.key,
    required this.title,
    required this.address,
    required this.doctorName,
    required this.dateTime,
    required this.code,
    required this.appointment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tiêu đề và nút xóa
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              IconButton(
                onPressed: () {
                  print('Xóa lịch khám');
                },
                icon: const Icon(Icons.cancel, color: Colors.red),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          // Thông tin địa chỉ
          _buildInfoRow(Icons.location_on, address),
          const SizedBox(height: 6.0),
          // Thông tin bác sĩ
          _buildInfoRow(Icons.person, 'CKII. $doctorName'),
          const SizedBox(height: 6.0),
          // Ngày giờ khám
          _buildInfoRow(Icons.access_time, dateTime, isBold: true),
          const SizedBox(height: 6.0),
          // Mã số khám
          _buildInfoRow(Icons.qr_code, code, isBold: true, isRed: true),
          if (appointment)
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  print('Đặt lịch');
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF208E00), width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text(
                    'Đặt lịch',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF3D9A00),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // Widget hàng thông tin
  Widget _buildInfoRow(IconData icon, String text,
      {bool isBold = false, bool isRed = false}) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.green),
        const SizedBox(width: 8.0),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: isRed ? Colors.red : Colors.black87,
          ),
        ),
      ],
    );
  }
}
