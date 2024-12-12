import 'package:flutter/material.dart';
import 'package:health_care/src/widget/custom_header.dart';
import 'package:health_care/src/widget/action_button.dart';


class Examination extends StatefulWidget {
  const Examination({super.key});
  @override
  State<StatefulWidget> createState() {
    return _Examination();
  }
}

class _Examination extends State<StatefulWidget> {
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
          ))
        ],
      ),
    );
  }
}
