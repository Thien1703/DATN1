import 'package:flutter/material.dart';

// Tạo widget cho phần Header (CustomProfile)
class CustomProfile extends StatelessWidget {
  final String name;
  final String avatarPath;
  final Widget bodyContent;

  const CustomProfile({
    super.key,
    required this.name,
    required this.avatarPath,
    required this.bodyContent, // Phần nội dung sẽ truyền vào
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size(double.infinity, 250), // Đặt chiều cao của appBar là 250
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/imageprofile.png'), // Đường dẫn đến hình ảnh
              fit: BoxFit.cover, // Đảm bảo hình ảnh phủ toàn bộ phần header
            ),
          ),
          child: Stack(
            children: [
              // Nền trắng phía dưới
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 100, // Chiều cao của phần nền trắng
                  decoration: BoxDecoration(
                    color: Colors.white, // Nền trắng
                  ),
                ),
              ),
              // Avatar nằm trên ảnh nền
              Positioned(
                top: 150, // Vị trí avatar trên màn hình
                left: 155,
                child: CircleAvatar(
                  radius: 45, // Kích thước avatar
                  backgroundImage:
                      AssetImage(avatarPath), // Đường dẫn đến ảnh avatar
                ),
              ),
              // Tên và dòng "xin chào" căn giữa
              Positioned(
                bottom: -5, // Vị trí tên và xin chào
                left: 0,
                right: 0,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Xin chào',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20, // Cỡ chữ cho "Xin chào"
                          fontWeight: FontWeight.bold, // Độ đậm nhẹ hơn
                        ),
                      ),
                      Text(
                        name, // Tên bác sĩ
                        style: TextStyle(
                          color: Colors.black, // Màu chữ
                          fontSize: 20, // Cỡ chữ cho tên
                          fontWeight: FontWeight.bold, // Độ đậm của chữ
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: bodyContent, // Phần bodyContent sẽ được truyền vào
    );
  }
}
