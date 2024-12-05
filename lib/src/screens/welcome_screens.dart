import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:health_care/src/screens/Auth/login_screens.dart';
import 'package:health_care/src/screens/home/home_screens.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Wellcomescreens extends StatefulWidget {
  const Wellcomescreens({super.key});

  @override
  _WellcomescreensState createState() => _WellcomescreensState();
}

class _WellcomescreensState extends State<Wellcomescreens> {
  final List<String> imgList = [
    'assets/images/banner1.png',
    'assets/images/banner2.png',
    'assets/images/banner3.png',
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                pauseAutoPlayOnTouch: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentPage = index;
                  });
                },
              ),
              items: imgList
                  .map((item) => Center(
                      child: Image.asset(item, fit: BoxFit.cover, width: 1000)))
                  .toList(),
            ),
            const SizedBox(height: 30.0),
            SmoothPageIndicator(
              controller: PageController(initialPage: _currentPage),
              count: imgList.length,
              effect: const WormEffect(
                activeDotColor: Colors.blue,
                dotColor: Colors.grey,
                dotHeight: 8.0,
                dotWidth: 8.0,
                spacing: 16.0,
              ),
            ),
            const SizedBox(height: 40.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                'Giúp bạn tìm được các phòng khám đúng với nhu cầu của bạn',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreens()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text(
                'Đặt ngay',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Bạn đã có tài khoản? '),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                  child: const Text(
                    'Đăng nhập',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 90.0),
          ],
        ),
      ),
    );
  }
}
