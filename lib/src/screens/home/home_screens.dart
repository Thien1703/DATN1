import 'package:flutter/material.dart';
import 'package:health_care/src/screens/home/medical_screen.dart';

class HomeScreens extends StatefulWidget {
  @override
  _HomeScreensState createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  int _selectedIndex = 0;

  // Chuyển đổi màn hình dựa trên chỉ mục đã chọn
  Widget _getBody() {
    switch (_selectedIndex) {
      case 0:
        return AccountScreen();
      case 1:
        return SearchScreen();
      case 2:
        return MedicalScreen();
      default:
        return Center(child: Text('Tính năng đang được phát triển'));
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: _getBody(),  // Chuyển đổi thân màn hình
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Tài khoản',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Tìm kiếm',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.medical_services),
              label: 'Thăm khám',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.white,
          selectedIconTheme: const IconThemeData(
            color: Colors.white, // Màu sắc của biểu tượng khi được chọn
            size: 40,
          ),
          backgroundColor: Colors.green,
          unselectedItemColor: Colors.white,
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}

// Màn hình Tài khoản
class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Tài khoản',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

// Màn hình Tìm kiếm
class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Tìm kiếm',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}



