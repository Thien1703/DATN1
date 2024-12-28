import 'dart:developer';
import 'dart:typed_data';

import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:health_care/src/model/booking_model.dart';
import 'package:health_care/src/model/data_hospital.dart';
import 'package:health_care/src/model/data_search_model.dart';
import 'package:health_care/src/screens/home/map_explore/search_map_view.dart';
import 'package:health_care/src/utils/common.dart';
import 'package:health_care/src/widget/widgetmap/form_field_widget.dart';
import 'package:health_care/src/widget/widgetmap/header_dialog.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late GoogleMapController mapController;
  TextEditingController textController = TextEditingController(text: '');
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController phoneController = TextEditingController(text: '');

  List<String> listTime = [
    "11:20",
    "11:30",
    "11:20",
    "11:30",
    "11:20",
    "11:30",
  ];
  List<Marker> listMarker = [];
  bool isLoading = true;
  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Doctor selectedDoctor = Doctor(id: -1);
  TimeWorking selectedTimeWorking = TimeWorking(time: '');

  Future<Uint8List> getBytesFromAsset() async {
    ByteData data = await rootBundle.load('assets/images/maker.png');
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: 42);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  onConfirmButton(DataHospital data) {
    String nameCustomer = nameController.text;
    String phoneNumber = phoneController.text;
    TimeWorking timeBooking = selectedTimeWorking;
    Doctor doctor = selectedDoctor;
    DateTime dateBooking = DateTime.now();
    BookingModel bookingModel = BookingModel(
        name: nameCustomer,
        doctor: doctor,
        dateBooking: dateBooking,
        phoneNumber: phoneNumber,
        timeBooking: timeBooking);
    showDialogFinal(context, data, bookingModel);
  }

  void showDialogFinal(
      BuildContext context, DataHospital data, BookingModel bookingModel) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green, width: 4)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderDialog(
                  title: data.hospital!,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(8),
                        decoration: UtilCommon.defautBox(
                            bdColor: Colors.grey, withBd: 1.5),
                        child: Column(
                          children: [
                            UtilCommon.textH1(
                                text: '${data.hospital}', color: Colors.green),
                            Text(
                              'PK HAPPY CARE chân thành cảm ơn quý khách đã lựa chọn dịch vụ của chúng tôi. Sức khỏe của bạn là ưu tiên hàng đầu của chúng tôi.',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 10, color: Colors.grey),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Quý khách thăm khám bệnh vui lòng đến trước 20 phút trước lịch hẹn để được phục vụ tốt nhất.',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 10, color: Colors.grey),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: 'Số điện thoại',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: '  ${data.phone}',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.green,
                                      fontWeight: FontWeight.w600))
                            ]))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(8),
                        decoration: UtilCommon.defautBox(
                            bdColor: Colors.grey, withBd: 1.5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: UtilCommon.textH1(
                                  size: 16,
                                  text: 'THÔNG TIN ĐẶT KHÁM',
                                  color: Colors.green),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            UtilCommon.textSubTitle3(
                                text: 'Đặt lịch bởi: ${bookingModel.name}',
                                color: Colors.grey),
                            SizedBox(
                              height: 5,
                            ),
                            UtilCommon.textSubTitle3(
                                text: 'Liên hệ: ${bookingModel.phoneNumber}',
                                color: Colors.grey),
                            SizedBox(
                              height: 5,
                            ),
                            UtilCommon.textSubTitle3(
                                text:
                                    'Thời gian khám: ${bookingModel.timeBooking.time} - ${DateFormat('dd/MM/yyyy').format(bookingModel.dateBooking)}',
                                color: Colors.grey),
                            SizedBox(height: 5),
                            UtilCommon.textSubTitle3(
                                text:
                                    'Thời gian đặt lịch: ${DateFormat('HH:mm - dd/MM/yyyy').format(bookingModel.dateBooking)}',
                                color: Colors.grey),
                            Divider(color: Colors.grey),
                            SizedBox(height: 5),
                            Center(
                              child: UtilCommon.textH1(
                                  size: 16,
                                  text: 'THÔNG TIN THĂM KHÁM',
                                  color: Colors.green),
                            ),
                            SizedBox(height: 5),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: 'Thăm khám : ',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: ' ${bookingModel.doctor.name}',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w900))
                            ]))
                          ],
                        ),
                      ),
                      QrImageView(
                        data: '4F450TY',
                        version: QrVersions.auto,
                        size: 60,
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    selectedDoctor = data.listDoctor!.first;
                    showBookingDialog(context, data);
                  },
                  child: Container(
                      decoration: BoxDecoration(color: Colors.green),
                      width: double.infinity,
                      height: 50,
                      padding:
                          EdgeInsets.symmetric(horizontal: 80, vertical: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white, width: 2)),
                        alignment: Alignment.center,
                        child: Text(
                          'Hoàn tất'.toUpperCase(),
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showCustomDialog(BuildContext context, DataHospital data) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green, width: 4)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderDialog(
                  title: data.hospital!,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              clipBehavior: Clip.hardEdge,
                              height: 80,
                              width: 80,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.green, width: 4),
                                  shape: BoxShape.circle),
                              child: Image.asset(
                                'assets/images/banner3.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _textData(
                                    title: 'Phụ trách chuyên môn',
                                    content: '${data.mainDoctor}'),
                                _textData(
                                    title: 'Chuyên khoa',
                                    content: '${data.special}'),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      _textData(title: 'Địa chỉ', content: '${data.address}'),
                      SizedBox(
                        height: 5,
                      ),
                      _textData(
                          title: 'Số điện thoại', content: '${data.phone}'),
                      Text(
                        'Thăm khám bệnh',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                      // ListView.builder(
                      //   primary: false,
                      //   shrinkWrap: true,
                      //   physics: NeverScrollableScrollPhysics(),
                      //   itemCount: data.list!.length,
                      //   itemBuilder: (context, index) => Text('- ${data.list![index]}'),
                      // ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: data.list!.map((e) => Text('- $e')).toList(),
                      ),
                      Text(
                        'Thời gian khám',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                            data.listTime!.map((e) => Text('- $e')).toList(),
                      ),
                      Text(
                        'Bác sĩ cùng phòng khám',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    selectedDoctor = data.listDoctor!.first;
                    showBookingDialog(context, data);
                  },
                  child: Container(
                      decoration: BoxDecoration(color: Colors.green),
                      width: double.infinity,
                      height: 50,
                      padding:
                          EdgeInsets.symmetric(horizontal: 80, vertical: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white, width: 2)),
                        alignment: Alignment.center,
                        child: Text(
                          'Đặt lịch'.toUpperCase(),
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Column _textData({required String title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),
        ),
        Text(
          content,
          style: TextStyle(
              fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  fetchDataForHospital() {
    //call api truyen ID

    //http.get();
    DataHospital data = DataHospital(
        hospital: 'Bệnh viện Quận 789',
        mainDoctor: 'CKII. Nguyễn Tuấn Phong',
        special: "Khoa nhi, dinh dưỡng",
        phone: "0909123456 - 091234567 - 02841234567",
        address: "30 Lâm văn bền, P Tân Kiểng , Q7 , TP HCM",
        list: [
          "Bệnh đường hô hấp",
          "Tư vấn dinh dưỡng",
          "Tay chân miệng",
          "Các bệnh nhi khác"
        ],
        listTime: [
          "Thứ 2 đến thứ 6",
          "    + Sáng : 9h00 -11h30",
          "    + Chiều : 1h30 -20h30",
          "Thứ 7, Chủ nhật",
          "    + Sáng : 9h30 -11h30",
          "    + Chiều : 1h30 -20h30",
        ],
        listDoctor: [
          Doctor(id: 1, name: "Bac Si Nguyen Van A", timeWorkingMorning: [
            TimeWorking(
              time: "7:00",
              isBooking: true,
            ),
            TimeWorking(
              time: "8:00",
              isBooking: false,
            ),
            TimeWorking(
              time: "8:30",
              isBooking: false,
            ),
            TimeWorking(
              time: "9:00",
              isBooking: false,
            ),
            TimeWorking(
              time: "9:30",
              isBooking: true,
            ),
            TimeWorking(
              time: "11:00",
              isBooking: false,
            ),
            TimeWorking(
              time: "11:30",
              isBooking: false,
            ),
          ], timeWorkingAfternoon: [
            TimeWorking(
              time: "12:00",
              isBooking: false,
            ),
            TimeWorking(
              time: "13:00",
              isBooking: false,
            ),
            TimeWorking(
              time: "14:00",
              isBooking: false,
            ),
            TimeWorking(
              time: "15:00",
              isBooking: false,
            )
          ]),
          Doctor(id: 2, name: "Bac Si Nguyen Van B", timeWorkingMorning: [
            TimeWorking(
              time: "7:00",
              isBooking: false,
            ),
            TimeWorking(
              time: "9:00",
              isBooking: false,
            ),
            TimeWorking(
              time: "10:00",
              isBooking: false,
            ),
            TimeWorking(
              time: "11:00",
              isBooking: true,
            )
          ], timeWorkingAfternoon: [
            TimeWorking(
              time: "12:00",
              isBooking: true,
            ),
            TimeWorking(
              time: "13:00",
              isBooking: true,
            ),
            TimeWorking(
              time: "14:00",
              isBooking: false,
            ),
            TimeWorking(
              time: "15:00",
              isBooking: false,
            )
          ])
        ]);
    showCustomDialog(context, data);
  }

  Future<void> fetchNearlyHospital() async {
    await Future.delayed(Duration(seconds: 2));
    final Uint8List markerIcon = await getBytesFromAsset();

    listMarker.add(Marker(
      icon: BitmapDescriptor.bytes(markerIcon),
      markerId: MarkerId('1'),
      infoWindow: InfoWindow(title: 'Bệnh viện Quận lotte'),
      position: LatLng(10.743334228325338, 106.70244187314546),
      onTap: () {
        fetchDataForHospital();
      },
    ));

    listMarker.add(Marker(
      icon: BitmapDescriptor.bytes(markerIcon),
      markerId: MarkerId('1'),
      infoWindow: InfoWindow(title: 'Bệnh viện lotte'),
      position: LatLng(10.848526545729658, 106.77303296724956),
      onTap: () {
        fetchDataForHospital();
      },
    ));

    listMarker.add(Marker(
      icon: BitmapDescriptor.bytes(markerIcon),
      markerId: MarkerId('1'),
      infoWindow: InfoWindow(title: 'Bệnh viện city'),
      position: LatLng(10.74312365094675, 106.70108474433341),
      onTap: () {
        fetchDataForHospital();
      },
    ));
  }

  void showBookingDialog(BuildContext context, DataHospital data) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: StatefulBuilder(builder: (context, setStateB) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green, width: 4)),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderDialog(
                      title: data.hospital!,
                    ),
                    SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(
                            child: ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                width: 5,
                              ),
                              padding: EdgeInsets.symmetric(vertical: 10),
                              scrollDirection: Axis.horizontal,
                              itemCount: data.listDoctor!.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    log('Click');
                                    setStateB(() {
                                      selectedDoctor = data.listDoctor![index];
                                    });
                                  },
                                  child: Container(
                                    width: 150,
                                    height: 15,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: data.listDoctor![index].id ==
                                                selectedDoctor.id
                                            ? Colors.green
                                            : Colors.grey.shade300),
                                    alignment: Alignment.center,
                                    child: UtilCommon.textSubTitle3(
                                        text: '${data.listDoctor![index].name}',
                                        color: data.listDoctor![index].id ==
                                                selectedDoctor.id
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight:
                                            data.listDoctor![index].id ==
                                                    selectedDoctor.id
                                                ? FontWeight.bold
                                                : FontWeight.w600),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      height: 1,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_month),
                        Text(
                            '${DateFormat('dd/MM/yyyy').format(DateTime.now())}',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                    //
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _chipValue(title: 'Trống', colorBg: Colors.green),
                          _chipValue(
                              title: 'Đã đặt',
                              colorBg: Colors.grey.withOpacity(0.5)),
                          _chipValue(title: 'Đã chọn', colorBg: Colors.amber)
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      decoration: UtilCommon.defautBox(
                          bgColor: Colors.green, radius: 15),
                      child: UtilCommon.textSubTitle3(
                          text: 'Sáng : 11:30 - 13:30', color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GridView.count(
                        padding: EdgeInsets.all(8),
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        childAspectRatio: (1 / .3),
                        crossAxisCount: 4,
                        crossAxisSpacing: 2.0,
                        mainAxisSpacing: 12.0,
                        children: List.generate(
                          selectedDoctor.timeWorkingMorning!.length,
                          (index) {
                            bool isWorking = selectedDoctor
                                .timeWorkingMorning![index].isBooking!;
                            Color bg =
                                selectedDoctor.timeWorkingMorning![index] ==
                                        selectedTimeWorking
                                    ? Colors.amber
                                    : isWorking
                                        ? Colors.grey.withOpacity(0.5)
                                        : Colors.green;
                            Color? textColor =
                                (selectedDoctor.timeWorkingMorning![index] ==
                                            selectedTimeWorking ||
                                        !isWorking)
                                    ? Colors.white
                                    : null;
                            return GestureDetector(
                              onTap: () {
                                if (!selectedDoctor
                                    .timeWorkingMorning![index].isBooking!) {
                                  setStateB(() {
                                    selectedTimeWorking = selectedDoctor
                                        .timeWorkingMorning![index];
                                  });
                                }
                              },
                              child: _chipValue(
                                  title:
                                      '${selectedDoctor.timeWorkingMorning![index].time}',
                                  colorBg: bg,
                                  colorText: textColor,
                                  radius: 15),
                            );
                          },
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      decoration: UtilCommon.defautBox(
                          bgColor: Colors.green, radius: 15),
                      child: UtilCommon.textSubTitle3(
                          text: 'Chiều : 11:30 - 13:30', color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GridView.count(
                        padding: EdgeInsets.all(8),
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        childAspectRatio: (1 / .3),
                        crossAxisCount: 4,
                        crossAxisSpacing: 2.0,
                        mainAxisSpacing: 12.0,
                        children: List.generate(
                          selectedDoctor.timeWorkingAfternoon!.length,
                          (index) {
                            bool isWorking = selectedDoctor
                                .timeWorkingAfternoon![index].isBooking!;
                            Color bg =
                                selectedDoctor.timeWorkingAfternoon![index] ==
                                        selectedTimeWorking
                                    ? Colors.amber
                                    : isWorking
                                        ? Colors.grey.withOpacity(0.5)
                                        : Colors.green;
                            Color? textColor =
                                (selectedDoctor.timeWorkingAfternoon![index] ==
                                            selectedTimeWorking ||
                                        !isWorking)
                                    ? Colors.white
                                    : null;
                            return GestureDetector(
                              onTap: () {
                                if (!selectedDoctor
                                    .timeWorkingAfternoon![index].isBooking!) {
                                  setStateB(() {
                                    selectedTimeWorking = selectedDoctor
                                        .timeWorkingAfternoon![index];
                                  });
                                }
                              },
                              child: _chipValue(
                                  title:
                                      '${selectedDoctor.timeWorkingAfternoon![index].time}',
                                  colorBg: bg,
                                  colorText: textColor,
                                  radius: 15),
                            );
                          },
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        decoration: BoxDecoration(color: Colors.green),
                        width: double.infinity,
                        // padding:
                        //     EdgeInsets.symmetric(horizontal: 80, vertical: 5),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                decoration: UtilCommon.defautBox(),
                                // height: 50,
                                padding: EdgeInsets.all(10),
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    UtilCommon.textSubTitle3(
                                        text: 'Thông tin đặt lịch thăm khám',
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      decoration: UtilCommon.defautBox(
                                          bdColor: Colors.grey, withBd: 2),
                                      child: Row(
                                        children: [
                                          UtilCommon.textSubTitle3(
                                              text: 'Tên người đặt lịch',
                                              color: Colors.red),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                              child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: FormFieldWidget(
                                              setValueFunc: (v) {},
                                              controllerEditting:
                                                  nameController,
                                            ),
                                          ))
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      decoration: UtilCommon.defautBox(
                                          bdColor: Colors.grey, withBd: 2),
                                      child: Row(
                                        children: [
                                          UtilCommon.textSubTitle3(
                                              text: 'Số điện thoại',
                                              color: Colors.red),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                              child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: FormFieldWidget(
                                              setValueFunc: (v) {},
                                              controllerEditting:
                                                  phoneController,
                                            ),
                                          ))
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                onConfirmButton(data);
                              },
                              child: Container(
                                height: 40,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 80, vertical: 5),
                                decoration: UtilCommon.defautBox(
                                    radius: 16,
                                    bgColor: Colors.green,
                                    withBd: 2),
                                alignment: Alignment.center,
                                child: Text(
                                  'Xác nhận'.toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            );
          }),
        );
      },
    );
  }

  Container _chipValue(
      {required String title,
      required Color colorBg,
      double radius = 10,
      Color? colorText}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: UtilCommon.defautBox(bgColor: colorBg, radius: radius),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UtilCommon.textSubTitle3(text: title, color: colorText),
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.topic_sharp,
            color: Colors.white,
            size: 12,
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    ///call api lấy marker
    ///

    fetchNearlyHospital().then((v) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  actionOnTapLocation(DataSearchModel? data) {
    if (data != null) {
      mapController
          .animateCamera(CameraUpdate.newLatLng(LatLng(data.lat!, data.lng!)));
      textController.text = data.description ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: isLoading
          ? Center(
              child: SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            ))
          : SafeArea(
              child: Stack(
              children: [
                GoogleMap(
                    style:
                        '[{"featureType": "poi.business","stylers": [{ "visibility": "off" }]}]',
                    markers: Set.from(listMarker),
                    myLocationEnabled: true,
                    onMapCreated: onMapCreated,
                    zoomControlsEnabled: false,
                    initialCameraPosition: CameraPosition(
                        zoom: 16,
                        target:
                            LatLng(10.743334228325338, 106.70244187314546))),
                GestureDetector(
                  onTap: () async {
                    DataSearchModel? data = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchAddressPage()),
                    );
                    actionOnTapLocation(data);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: FormFieldWidget(
                      controllerEditting: textController,
                      setValueFunc: (value) {},
                      borderColor: Colors.black,
                      radiusBorder: 20,
                      labelText: 'Nhập địa chỉ tìm kiếm',
                      padding: 15,
                      isEnabled: false,
                      icon: Icon(Icons.search),
                    ),
                  ),
                )
              ],
            )),
    );
  }
}
