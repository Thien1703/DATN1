import 'package:flutter/material.dart';
import 'package:health_care/src/custom/Custom_header.dart';
import 'package:health_care/src/screens/booking/Screen.dart';

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
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Column(
            children: [
              CustomHeader('THÔNG TIN THĂM KHÁM'),
              Screen(),
            ],
          ),
        ));
  }
}
