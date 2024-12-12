import 'package:flutter/material.dart';
import 'package:health_care/src/widget/custom_infoProfile.dart';

class BtnExamination extends StatefulWidget {
  const BtnExamination({super.key});
  @override
  State<BtnExamination> createState() {
    return _BtnExamination();
  }
}

class _BtnExamination extends State<BtnExamination> {
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
    return Column(children: [
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
              child: const Text('Hiện tại',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))),
          const SizedBox(width: 15),
          ElevatedButton(
              onPressed: () {
                toggelButton(false);
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: isChoose
                      ? const Color(0xFFABABAB)
                      : const Color(0xFF00C100),
                  minimumSize: const Size(171, 44)),
              child: const Text('Lịch sử',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)))
        ],
      ),
      if (isChoose) ...[
        CustomInforProfile(
          nameHospital: 'PK HAPPY CARE',
          nameDoctor: ' CKII.Nguyễn Tuấn Phong',
          calender: '11:50 - 10/02/2023',
          medicine: '5 ngày thuốc',
          date: ' 15/02/2023',
          examination: 'Tái khám 15/02/2023',
        ),
        CustomInforProfile(
          nameHospital: 'PK SMILE CARE',
          nameDoctor: 'BS. ĐỖ NGUYỆT ANH',
          calender: '11:50 - 10/02/2023',
          medicine: '0 ngày thuốc',
          date: '',
          examination: 'Tái khám 15/02/2023',
        ),
        CustomInforProfile(
          nameHospital: 'PK HAPPY CARE',
          nameDoctor: ' CKII.Nguyễn Tuấn Phong',
          calender: '11:50 - 10/02/2023',
          medicine: '5 ngày thuốc',
          date: ' 15/02/2023',
          examination: 'Tái khám 15/02/2023',
        ),
        CustomInforProfile(
          nameHospital: 'PK SMILE CARE',
          nameDoctor: 'BS. ĐỖ NGUYỆT ANH',
          calender: '11:50 - 10/02/2023',
          medicine: '0 ngày thuốc',
          date: '',
          examination: 'Tái khám 15/02/2023',
        ),
        CustomInforProfile(
          nameHospital: 'PK HAPPY CARE',
          nameDoctor: ' CKII.Nguyễn Tuấn Phong',
          calender: '11:50 - 10/02/2023',
          medicine: '5 ngày thuốc',
          date: ' 15/02/2023',
          examination: 'Tái khám 15/02/2023',
        ),
        CustomInforProfile(
          nameHospital: 'PK SMILE CARE',
          nameDoctor: 'BS. ĐỖ NGUYỆT ANH',
          calender: '11:50 - 10/02/2023',
          medicine: '0 ngày thuốc',
          date: '',
          examination: 'Tái khám 15/02/2023',
        ),
      ] else
        ...[]
    ]);
  }
}
