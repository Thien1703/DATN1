import 'package:flutter/material.dart';

class BookingDiaLog extends StatelessWidget {
  const BookingDiaLog({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Dialog(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 80, bottom: 86),
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF4CAF50), width: 2),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    color: Color(0xFF4CAF50),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18),
                        topRight: Radius.circular(18))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/ic_resualBooking.png',
                          ),
                          SizedBox(width: 20),
                          Text(
                            'PK Happy Care',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          )
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset('assets/images/ic_resualExit.png'),
                      )
                    ]),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFDBDBDB), width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    Text(
                      'PK HAPPY CARE',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF4CAF50)),
                    ),
                    Text(
                      'PK HAPPY CARE chân thành cảm ơn quý khách đã lựa chọn dịch vụ của chúng tôi. Sức khỏe của bạn là ưu tiên hàng đầu của chúng tôi.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 11.5,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 83, 83, 83)),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Quý khách thăm khám bệnh vui lòng đến trước 20 phút trước lịch hẹn để được phục vụ tốt nhất.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 11.5,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 83, 83, 83)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Số điện thoại: ',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFFF0000)),
                        ),
                        Text(
                          '02841234567',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF4CAF50)),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10, left: 10),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFDBDBDB), width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 50),
                        Text(
                          'THÔNG TIN ĐẶT KHÁM',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF4CAF50)),
                        ),
                        SizedBox(width: 20),
                        Image.asset('assets/images/ic_resualBookingDetail.png')
                      ],
                    ),
                    containerRow(
                        title: 'Đặt lịch bởi: ',
                        information: 'NGUYỄN HOÀNG NAM'),
                    containerRow(title: 'Liên hệ: ', information: '0909511234'),
                    containerRow(
                        title: 'Thời gian khám: ',
                        information: '11:50 - 10/02/2023'),
                    containerRow(
                        title: 'Thời gian đặt: ',
                        information: '13:50 - 09/02/2023'),
                    line(),
                    Text(
                      'THÔNG TIN THĂM KHÁM',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF4CAF50)),
                    ),
                    Row(
                      children: [
                        Text(
                          'Thăm khám: ',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF858585)),
                        ),
                        Text(
                          'CKII. Nguyễn Tuấn Phong',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 112, 112, 112)),
                        )
                      ],
                    ),
                    line(),
                    Text(
                      'MÃ ĐẶT LỊCH',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF4CAF50)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 80),
                              child: Text(
                                '4F450TY',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFFFF0000)),
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Image.asset('assets/images/ic_picture.png'),
                                Text(
                                  'Chụp màn hình để lưu giữ',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFFFF9900)),
                                )
                              ],
                            )
                          ],
                        ),
                        Image.asset('assets/images/ic_qr.png'),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    color: Color(0xFF4CAF50),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(18),
                        bottomRight: Radius.circular(18))),
                child: Center(
                  child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.white, width: 1),
                          minimumSize: Size(110, 35)),
                      child: Text(
                        'HOÀN TẤT',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget containerRow({required String title, required String information}) {
  return Row(
    children: [
      Text(
        title,
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 83, 83, 83)),
      ),
      Text(
        information,
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color.fromARGB(255, 122, 121, 121)),
      )
    ],
  );
}

Widget line() {
  return Container(
    margin: EdgeInsets.only(top: 10, bottom: 10),
    width: 200,
    decoration: BoxDecoration(
        border:
            Border.all(color: Color.fromARGB(255, 189, 188, 188), width: 0.5)),
  );
}
