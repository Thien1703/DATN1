import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader(this.title, {super.key});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFF707070), width: 0.5),
        ),
      ),
      child: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            'assets/images/ic_back.png',
            width: 30,
            height: 30,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF4CAF50),
          ),
        ),
      ),
    );
  }
}
