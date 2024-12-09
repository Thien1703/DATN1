import 'package:flutter/material.dart';

class VisitInfoScreen extends StatefulWidget {
  const VisitInfoScreen({super.key});

  @override
  State<VisitInfoScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<VisitInfoScreen> {
//test data mẫu
  final List<Map<String, String>> currentList = [
    {
      "clinic": "PK THUAN AN",
      "doctor": "BS. Nguyễn Thiện Tâm",
      "calendar": "10:30 - 12/02/2023",
      "medicationDuration": "20/03/2023",
      "schedule": "7 ngày thuốc",
      "examination": "Tái khám 15/12/2023",
    },
    {
      "clinic": "PK ANH DUC",
      "doctor": "BS. Trần Thi Bích",
      "calendar": "14:20 - 01/03/2023",
      "medicationDuration": "05/04/2023",
      "schedule": "10 ngày thuốc",
      "examination": "Tái khám 22/11/2023",
    },
    {
      "clinic": "PK THUAN AN",
      "doctor": "BS. Nguyễn Thiện Tâm",
      "calendar": "09:00 - 10/01/2023",
      "medicationDuration": "15/02/2023",
      "schedule": "5 ngày thuốc",
      "examination": "Tái khám 30/10/2023",
    },
    {
      "clinic": "PK LUCKY CARE",
      "doctor": "BS. Hoàng Tuấn Anh",
      "calendar": "16:00 - 25/03/2023",
      "medicationDuration": "10/04/2023",
      "schedule": "3 ngày thuốc",
      "examination": "Tái khám 12/11/2023",
    },
    {
      "clinic": "PK SMILE DENTAL",
      "doctor": "BS. Đặng Lê Phương",
      "calendar": "11:30 - 18/04/2023",
      "medicationDuration": "01/06/2023",
      "schedule": "8 ngày thuốc",
      "examination": "Tái khám 05/11/2023",
    },
    {
      "clinic": "PK ANH DUC",
      "doctor": "BS. Trần Thi Bích",
      "calendar": "15:00 - 12/05/2023",
      "medicationDuration": "30/06/2023",
      "schedule": "6 ngày thuốc",
      "examination": "Tái khám 20/09/2023",
    },
  ];

  final List<Map<String, String>> historyList = [
    {
      "clinic": "PK VẠN PHÁT",
      "doctor": "BS. Nguyễn Thanh Minh",
      "calendar": "08:30 - 05/07/2023",
      "medicationDuration": "25/08/2023",
      "schedule": "5 ngày thuốc",
      "examination": "Tái khám 22/11/2023",
    },
    {
      "clinic": "PK LUCKY CARE",
      "doctor": "BS. Hoàng Tuấn Anh",
      "calendar": "13:40 - 03/06/2023",
      "medicationDuration": "20/07/2023",
      "schedule": "7 ngày thuốc",
      "examination": "Tái khám 10/10/2023",
    },
    {
      "clinic": "PK THUAN AN",
      "doctor": "BS. Nguyễn Thiện Tâm",
      "calendar": "10:00 - 22/02/2023",
      "medicationDuration": "10/04/2023",
      "schedule": "4 ngày thuốc",
      "examination": "Tái khám 18/09/2023",
    },
    {
      "clinic": "PK SMILE CARE",
      "doctor": "BS. Nguyễn Thu Hương",
      "calendar": "14:00 - 11/04/2023",
      "medicationDuration": "25/06/2023",
      "schedule": "10 ngày thuốc",
      "examination": "Tái khám 15/12/2023",
    },
    {
      "clinic": "PK ANH DUC",
      "doctor": "BS. Trần Thi Bích",
      "calendar": "09:15 - 07/01/2023",
      "medicationDuration": "15/03/2023",
      "schedule": "3 ngày thuốc",
      "examination": "Tái khám 01/10/2023",
    },
    {
      "clinic": "PK SMILE DENTAL",
      "doctor": "BS. Đặng Lê Phương",
      "calendar": "11:20 - 25/03/2023",
      "medicationDuration": "05/05/2023",
      "schedule": "6 ngày thuốc",
      "examination": "Tái khám 30/09/2023",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "THÔNG TIN THĂM KHÁM",
            style: TextStyle(
              color: Color(0xFF4CAF50),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_circle_left_outlined),
            color: Color(0xFF4CAF50),
            iconSize: 40,
          ),
          bottom: TabBar(
              indicator: ShapeDecoration(
                color: Color(0xFF4CAF50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.all(7),
              labelColor: Colors.white,
              tabs: [
                Tab(
                  child: Text("HIỆN TẠI"),
                ),
                Tab(
                  child: Text("LỊCH SỬ"),
                ),
              ]),
        ),
        body: TabBarView(children: [
          // Tab "HIỆN TẠI"
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: currentList.length,
                itemBuilder: (BuildContext context, int index) {
                  return VisitInfoItemWidget(
                    clinic: currentList[index]['clinic']!,
                    doctor: currentList[index]['doctor']!,
                    calendar: currentList[index]['calendar']!,
                    medicationDuration: currentList[index]
                        ['medicationDuration']!,
                    schedule: currentList[index]['schedule']!,
                    examination: currentList[index]['examination']!,
                  );
                }),
          ),
          // Tab "Lịch sử"
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: currentList.length,
                itemBuilder: (BuildContext context, int index) {
                  return VisitInfoItemWidget(
                    clinic: currentList[index]['clinic']!,
                    doctor: currentList[index]['doctor']!,
                    calendar: currentList[index]['calendar']!,
                    medicationDuration: currentList[index]
                        ['medicationDuration']!,
                    schedule: currentList[index]['schedule']!,
                    examination: currentList[index]['examination']!,
                  );
                }),
          ),
        ]),
      ),
    );
  }
}

//contructor object VisitInfoItemWidget
class VisitInfoItemWidget extends StatelessWidget {
  final String clinic;
  final String doctor;
  final String calendar;
  final String medicationDuration;
  final String schedule;
  final String examination;

  const VisitInfoItemWidget({
    super.key,
    required this.clinic,
    required this.doctor,
    required this.calendar,
    required this.medicationDuration,
    required this.schedule,
    required this.examination,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //tên phòng khám
            Container(
              padding: EdgeInsets.all(8),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Color(0xFFF5F5F5),
              ),
              child: Center(
                child: Text(
                  clinic,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4CAF50),
                  ),
                ),
              ),
            ),

            SizedBox(height: 8),

            Row(
              //Bác sĩ
              children: [
                Image.asset(
                  'assets/images/doctor.png',
                  width: 32,
                  height: 32,
                ),
                SizedBox(width: 8),
                Text(
                  doctor,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4CAF50),
                  ),
                ),
              ],
            ),

            SizedBox(height: 8),

            Row(
              //Lịch
              children: [
                Image.asset(
                  'assets/images/calendar.png',
                  width: 32,
                  height: 32,
                ),
                SizedBox(width: 8),
                Text(
                  calendar,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF9A9A9A),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  //Số lượng ngày uống thuốc
                  children: [
                    Image.asset(
                      'assets/images/medicine-drug.png',
                      width: 32,
                      height: 32,
                    ),
                    SizedBox(width: 8),
                    Text(
                      medicationDuration,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF4CAF50),
                      ),
                    ),
                  ],
                ),
                Row(
                  //Lịch trình thăm khám
                  children: [
                    Image.asset(
                      'assets/images/schedule.png',
                      width: 32,
                      height: 32,
                    ),
                    SizedBox(width: 8),
                    Text(
                      medicationDuration,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF4CAF50),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 8),

            Row(
              //Ket quả thăm khám
              children: [
                Image.asset(
                  'assets/images/examination.png',
                  width: 32,
                  height: 32,
                ),
                SizedBox(width: 8),
                Text(
                  calendar,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFFF0000),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
