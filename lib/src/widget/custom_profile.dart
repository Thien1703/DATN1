import 'package:flutter/material.dart';

class CustomProfile extends StatelessWidget {
  final String name;
  final String avatarPath;
  final Widget bodyContent;

  const CustomProfile({
    super.key,
    required this.name,
    required this.avatarPath,
    required this.bodyContent,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: bodyContent,
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: Size(double.infinity, 250),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/imageprofile.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            _buildWhiteBackground(),
            _buildAvatar(),
            _buildNameAndGreeting(),
          ],
        ),
      ),
    );
  }

  // Phần nền trắng dưới avatar
  Widget _buildWhiteBackground() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
      ),
    );
  }

  // Avatar trên ảnh nền
  Widget _buildAvatar() {
    return Positioned(
      top: 150,
      left: 155,
      child: CircleAvatar(
        radius: 45,
        backgroundImage: AssetImage(avatarPath),
      ),
    );
  }

  // Tên và dòng "xin chào"
  Widget _buildNameAndGreeting() {
    return Positioned(
      bottom: -5,
      left: 0,
      right: 0,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Xin chào',
              style: _buildTextStyle(),
            ),
            Text(
              name,
              style: _buildTextStyle(),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _buildTextStyle() {
    return TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
  }
}
