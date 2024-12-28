import 'package:flutter/material.dart';
import 'package:health_care/src/screens/home/medical_screen.dart';
import 'package:health_care/src/screens/home/account_screen.dart';
import 'package:health_care/src/screens/home/map_explore/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: _getBody(), // Chuyển đổi thân màn hình
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
