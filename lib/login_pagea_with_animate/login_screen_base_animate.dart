import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController _nameController;
  TextEditingController _pswController;

  Animation _animation;
  AnimationController _animationController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _pswController = TextEditingController();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = new Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));

    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _pswController.dispose();

    _animationController.dispose();

    super.dispose();
  }

  void handleSubmit() {
    print("click submit button");
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    print(width);

    return AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
            body: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: Transform(
              transform: Matrix4.translationValues(_animation.value * width, 0.0, 0.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/login_screen/icon.png",
                      width: 80.0,
                      height: 80.0,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80.0,
                    ),
                    TextField(
                      controller: _nameController,
                      autofocus: true,
                      decoration: InputDecoration(
                          hintText: "Please input username",
                          prefixIcon: Icon(Icons.person),
                          fillColor: Colors.grey,
                          filled: true,
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue))),
                    ),
                    TextField(
                      controller: _pswController,
                      decoration: InputDecoration(
                          hintText: "Please input password",
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(Icons.looks),
                          fillColor: Colors.grey,
                          filled: true,
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red))),
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 80.0,
                    ),
                    RaisedButton(
                      child: Text("Submit"),
                      color: Colors.white,
                      onPressed: handleSubmit,
                    )
                  ],
                ),
              ),
            )
          );
        });
  }
}
