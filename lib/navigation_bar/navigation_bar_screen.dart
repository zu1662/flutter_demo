import 'package:flutter/material.dart';
import 'package:flutter_demo/navigation_bar/pages/airplay_screen.dart';
import 'package:flutter_demo/navigation_bar/pages/home_screen.dart';
import 'package:flutter_demo/navigation_bar/pages/email_screen.dart';
import 'package:flutter_demo/navigation_bar/pages/page_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  BottomNavigationBarScreen({Key key}) : super(key: key);

  @override
  _BottomNavigationBarScreenState createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  final Color _navigationBarColor = Colors.blue;
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [HomeScreen(), EmailScreen(), PageScreen(), AirplayScreen()],
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 20.0,
        selectedItemColor: _navigationBarColor,
        onTap: (index) {
          setState(() {
            _pageController.jumpToPage(index);
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Text(
                "Home",
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.email,
              ),
              title: Text(
                "Email",
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.pages,
              ),
              title: Text(
                "Pages",
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.airplay,
              ),
              title: Text(
                "Airplay",
              )),
        ],
      ),
    );
  }
}
