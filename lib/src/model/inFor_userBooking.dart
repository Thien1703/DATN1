import 'dart:ffi';

class InfoBooking {
  final String nameHospital;
  final String image;
  final String ngayKham;
  final String gioDuKien;
  final String gioDangKy;
  final String benhNhan;
  final String phone;
  final int status;

  InfoBooking({
    required this.nameHospital,
    required this.image,
    required this.ngayKham,
    required this.gioDuKien,
    required this.gioDangKy,
    required this.benhNhan,
    required this.phone,
    required this.status,
  });
}
