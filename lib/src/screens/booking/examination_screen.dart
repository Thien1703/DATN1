import 'package:flutter/material.dart';
import 'package:health_care/src/widget/widget_Title/custom_header.dart';
import 'package:health_care/src/widget/action_button.dart';

class Examination extends StatelessWidget {
  const Examination({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomHeader('THÔNG TIN THĂM KHÁM'),
          Expanded(
            child: ListView(
              children: [
                BtnExamination(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
