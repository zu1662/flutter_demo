import 'package:flutter/material.dart';

/// 从正方形变化到圆形⭕️

class TransformScreen extends StatefulWidget {
  TransformScreen({Key key}) : super(key: key);

  @override
  _TransformScreenState createState() => _TransformScreenState();
}

class _TransformScreenState extends State<TransformScreen>
    with SingleTickerProviderStateMixin {
  Animation _animation;
  AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = BorderRadiusTween(
            begin: BorderRadius.circular(0.0),
            end: BorderRadius.circular(100.0))
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.easeInOut));
    _animationController.addStatusListener((status) {
      print(status);
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey,
        child: AnimatedBuilder(
            animation: _animation,
            builder: (BuildContext context, Widget child) {
              return Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: _animation.value, color: Colors.blue),
                  width: 200,
                  height: 200,
                  child: Center(
                    child: Text(_animation.value.toString()),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
