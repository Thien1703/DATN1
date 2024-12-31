import 'package:flutter/material.dart';
import 'package:health_care/src/screens/Auth/auth_service.dart';

import 'register_popup_noti.dart';

class RegisterPopup extends StatefulWidget {
  const RegisterPopup({super.key});

  @override
  _RegisterPopupState createState() => _RegisterPopupState();
}

class _RegisterPopupState extends State<RegisterPopup> {
  final TextEditingController _phoneEmailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _agreeTerms = false;

  String? _phoneEmailError;
  String? _nameError;
  String? _passwordError;
  String? _confirmPasswordError;
  String? _firebaseError;

  String? _validatePhoneEmail(String value) {
    if (value.isEmpty) {
      return 'Vui lòng nhập số điện thoại hoặc email.';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    final phoneRegex = RegExp(r'^\d{10,11}$');
    if (!emailRegex.hasMatch(value) && !phoneRegex.hasMatch(value)) {
      return 'Định dạng không hợp lệ\nNhập số điện thoại hoặc email.';
    }
    return null;
  }

  String? _validateName(String value) {
    if (value.isEmpty) {
      return 'Vui lòng nhập họ tên của bạn.';
    }
    if (value.length < 3) {
      return 'Họ tên phải có ít nhất 3 ký tự.';
    }
    return null;
  }

  String? _validatePassword(String value) {
    if (value.isEmpty) {
      return 'Vui lòng nhập mật khẩu.';
    }
    if (value.length < 6) {
      return 'Mật khẩu phải có ít nhất 6 ký tự.';
    }
    return null;
  }

  String? _validateConfirmPassword(String password, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return 'Vui lòng nhập lại mật khẩu.';
    }
    if (password != confirmPassword) {
      return 'Mật khẩu không khớp.';
    }
    return null;
  }


  Future<void> createUser() async {
    try {
      await AuthService().registerWithEmailAndPassword(
        _phoneEmailController.text.trim(),
        _passwordController.text.trim(),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RegisterPopupNoti()),
      );
    } catch (e) {
      setState(() {
        _firebaseError = e.toString();
      });
    }
  }

  void onRegisterPress() {
    setState(() {
      _phoneEmailError = _validatePhoneEmail(_phoneEmailController.text);
      _nameError = _validateName(_nameController.text);
      _passwordError = _validatePassword(_passwordController.text);
      _confirmPasswordError = _validateConfirmPassword(
        _passwordController.text,
        _confirmPasswordController.text,
      );
      _firebaseError = null; // Clear previous Firebase error
    });

    if (_phoneEmailError == null &&
        _nameError == null &&
        _passwordError == null &&
        _confirmPasswordError == null &&
        _agreeTerms) {
      createUser();
      // Chuyển sang màn hình thông báo đăng ký thành công
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RegisterPopupNoti()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              padding: const EdgeInsets.all(15),
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.account_circle, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        'ĐĂNG KÝ TÀI KHOẢN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                controller: _phoneEmailController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Số điện thoại hoặc email',
                  labelStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  errorText: _phoneEmailError,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Họ tên của bạn',
                  labelStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  errorText: _nameError,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Mật khẩu',
                  labelStyle: const TextStyle(color: Colors.grey),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  errorText: _passwordError,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                controller: _confirmPasswordController,
                obscureText: _obscureConfirmPassword,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Nhập lại mật khẩu',
                  labelStyle: const TextStyle(color: Colors.grey),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  errorText: _confirmPasswordError,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                  value: _agreeTerms,
                  onChanged: (bool? value) {
                    setState(() {
                      _agreeTerms = value ?? false;
                    });
                  },
                ),
                Expanded(
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Khi đăng ký, bạn đồng ý với\n',
                          style: TextStyle(fontSize: 10, color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Điều khoản dịch vụ ',
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF4CAF50),
                          ),
                        ),
                        TextSpan(
                          text: 'và ',
                          style: TextStyle(fontSize: 10, color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Chính Sách về Sự Riêng Tư',
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF4CAF50),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (_firebaseError != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _firebaseError!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              padding: const EdgeInsets.all(8),
              child: Center(
                child: OutlinedButton(
                  onPressed: _agreeTerms ? onRegisterPress : null,
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(118, 36),
                  ),
                  child: const Text(
                    'ĐĂNG KÝ',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
