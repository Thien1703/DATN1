    import 'package:flutter/material.dart';

class HomeScreens extends StatefulWidget {
  @override
  _HomeScreensState createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Thêm hành động khi nhấn vào các icon trong thanh điều hướng ở đây
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Center(
          child: Text(
            'Index $_selectedIndex: Tính năng đang được phát triển',
            style: TextStyle(fontSize: 24),
          ),
        ),
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
        ));
  }
}
