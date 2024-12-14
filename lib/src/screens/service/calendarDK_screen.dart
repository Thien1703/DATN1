import 'package:flutter/material.dart';

class CalendardkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MedicalAppointmentScreen(),
    );
  }
}

class MedicalAppointmentScreen extends StatelessWidget {
  const MedicalAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset('assets/icons/back.png', height: 24, width: 24), // Thay icon bằng ảnh
          onPressed: () {},
        ),
        title: Text(
          'Đến Khám',
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tiêu đề Phòng Khám
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'PK HAPPY CARE',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      'assets/icons/close.png', // Thay icon đóng bằng ảnh
                      height: 24,
                      width: 24,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),

              // Địa chỉ
              Row(
                children: [
                  Image.asset(
                    'assets/icons/location.png', // Thay icon địa điểm bằng ảnh
                    height: 24,
                    width: 24,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '30 Lâm Văn Bền, P Tân Kiểng, Q7',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),

              // Thông tin bác sĩ
              Row(
                children: [
                  Image.asset(
                    'assets/icons/doctor.png', // Thay icon bác sĩ bằng ảnh
                    height: 24,
                    width: 24,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'CKII. Nguyễn Tuấn Phong',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Thời gian và mã số
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/calendar.png', // Thay icon lịch bằng ảnh
                        height: 24,
                        width: 24,
                      ),
                      SizedBox(width: 8),
                      Text(
                        '11:50 - 10/02/2023',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/qr_code.png', // Thay icon mã QR bằng ảnh
                        height: 24,
                        width: 24,
                      ),
                      SizedBox(width: 8),
                      Text(
                        '4F450TY',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Nút bấm
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/qr_scan.png', // Thay icon quét mã QR bằng ảnh
                          height: 24,
                          width: 24,
                        ),
                        SizedBox(width: 8),
                        Text('Đến Khám'),
                      ],
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.green),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Đặt lịch',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
