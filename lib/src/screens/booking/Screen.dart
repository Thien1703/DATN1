import 'package:flutter/material.dart';
import 'package:health_care/src/custom/Custom_infoProfile.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});
  @override
  State<Screen> createState() {
    return _Screen();
  }
}

class _Screen extends State<Screen> {
  bool isChoose = true;
  void toggelButton(bool value) {
    setState(
      () {
        isChoose = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                toggelButton(true);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: isChoose
                    ? const Color(0xFF00C100)
                    : const Color(0xFFABABAB),
                minimumSize: const Size(181, 44),
              ),
              child: const Text(
                'Hiện tại',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            ElevatedButton(
              onPressed: () {
                toggelButton(false);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: isChoose
                    ? const Color(0xFFABABAB)
                    : const Color(0xFF00C100),
                minimumSize: const Size(171, 44),
              ),
              child: const Text(
                'Lịch sử',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        if (isChoose) ...[
          const CustomInforProfile(),
          const CustomInforProfile(),
        ] else ...[
          const CustomInforProfile(),
        ]
      ],
    );
  }
}
