import 'package:flutter/material.dart';
import 'package:health_care/src/screens/Auth/auth_service.dart';
import 'package:health_care/src/screens/Auth/register_popup.dart';
import 'package:health_care/src/screens/home/home_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _showPass = false;
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final _userERR = 'Tài khoản không hợp lệ';
  final _passERR = 'Mật khẩu phải trên 6 kí tự';
  bool _userInvalid = false;
  bool _passInvalid = false;
  String? _firebaseError;

  bool validateUserName(String userName) {
    bool isPhoneNumber = RegExp(r'^\d+$').hasMatch(userName);
    bool containsAtSymbol = userName.contains('@');
    bool isValid = userName.length > 6 && (isPhoneNumber || containsAtSymbol);
    return isValid;
  }

  // void onLoginClick() {
  //   setState(
  //     () {
  //       _userInvalid = !validateUserName(_userController.text);
  //       _passInvalid = _passController.text.length < 6;
  //       if (!_userInvalid && !_passInvalid) {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (context) => HomeScreens()),
  //         );
  //       }
  //     },
  //   );
  // }

  Future<void> onLoginClick() async {
    setState(() {
      _userInvalid = !validateUserName(_userController.text);
      _passInvalid = _passController.text.length < 6;
      _firebaseError = null; // Clear previous Firebase error
    });

    if (!_userInvalid && !_passInvalid) {
      try {
        await AuthService().loginWithEmailAndPassword(
          _userController.text.trim(),
          _passController.text.trim(),
        );
        // Navigate to Home Screen on success
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } catch (e) {
        setState(() {
          _firebaseError = e.toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: EdgeInsets.fromLTRB(
              30, 0, 30, MediaQuery.of(context).viewInsets.bottom),
          constraints: const BoxConstraints.expand(),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Container(
                    width: double.infinity,
                    height: 100,
                    padding: const EdgeInsets.all(15),
                    child: Image.asset('assets/images/doctor_ic.png')),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Text(
                  'Chúng Tôi \nLuôn luôn quan tâm Tới sức khỏe của bạn',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: TextField(
                  controller: _userController,
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                    labelText: ('USERNAME'),
                    errorText: _userInvalid ? _userERR : null,
                    labelStyle: const TextStyle(
                      color: Color(0xff888888),
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: <Widget>[
                    TextField(
                      controller: _passController,
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                      obscureText: !_showPass,
                      decoration: InputDecoration(
                        labelText: ('PASSWORD'),
                        errorText: _passInvalid ? _passERR : null,
                        labelStyle: const TextStyle(
                          color: Color(0xff888888),
                          fontSize: 12,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: onShowPass,
                      child: Text(
                        _showPass ? 'Hide' : 'Show',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              if (_firebaseError != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    _firebaseError!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: onLoginClick,
                    child: const Text(
                      'SIGN IN',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        // Xử lý khi người dùng nhấn vào Quên mật khẩu
                      },
                      child: const Text(
                        'Quên mật khẩu?',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Bạn chưa có tài khoản? '),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return RegisterPopup();
                            },
                          );
                        },
                        child: const Text(
                          'Đăng ký ngay',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  'hoặc',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        try {
                          final user = await AuthService().loginWithGoogle();
                          if (user != null) {
                            // Navigate to Home Screen on success
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()),
                            );
                          }
                        } catch (e) {
                          setState(() {
                            _firebaseError = e.toString();
                          });
                        }
                      },
                      child: Image.asset(
                        'assets/images/google.png',
                        height: 40,
                        width: 40,
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () async {
                        try {
                          final user = await AuthService().loginWithFacebook();
                          if (user != null) {
                            print(
                                'Đăng nhập thành công: ${user.displayName} (${user.email})');
                            // Thực hiện các hành động sau khi đăng nhập thành công (chuyển màn hình, lưu thông tin, v.v.)
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()),
                            );
                          }
                        } catch (e) {
                          print('Đăng nhập Facebook thất bại: $e');
                          // Hiển thị thông báo lỗi hoặc xử lý logic khi thất bại
                        }
                      },
                      child: Image.asset(
                        'assets/images/facebook.png',
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void onShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }
}
