import 'package:flutter/material.dart';
import 'package:flutter_demo/login_pagea_with_animate/index.dart';
import 'package:flutter_demo/navigation_bar/pages/airplay_screen.dart';
import 'package:flutter_demo/navigation_bar/pages/home_screen.dart';
import 'package:flutter_demo/navigation_bar/pages/email_screen.dart';
import 'package:flutter_demo/navigation_bar/pages/page_screen.dart';

class BottomBarScreen extends StatefulWidget {
  BottomBarScreen({Key key}) : super(key: key);

  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _currentIndex = 0;
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
          children: [
            HomeScreen(),
            EmailScreen(),
            PageScreen(),
            AirplayScreen()
          ],
          physics: NeverScrollableScrollPhysics(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => LoginScreenIndex()));
          },
          tooltip: "IncrementFloat",
          heroTag: "FlaotAdd",
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    _pageController.jumpToPage(0);
                    _currentIndex = 0;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.email),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    _pageController.jumpToPage(1);
                    _currentIndex = 1;
                  });
                },
              ),
            ],
          ),
        ));
  }
}
