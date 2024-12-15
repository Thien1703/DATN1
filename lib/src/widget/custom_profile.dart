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
      body: SingleChildScrollView( // Makes body scrollable
        child: bodyContent,
      ),
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

  // White background under the avatar
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

  // Avatar on the background image
  Widget _buildAvatar() {
    return Positioned(
      top: 150,
      // ignore: deprecated_member_use
      left: MediaQueryData.fromView(WidgetsBinding.instance.window)
              .size
              .width /
          2 -
          45, // Centers the avatar
      child: CircleAvatar(
        radius: 45,
        backgroundImage: AssetImage(avatarPath),
      ),
    );
  }

  // Greeting text and name
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
