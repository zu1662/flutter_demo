import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // TextEditingController _nameController;
  // TextEditingController _pswController;

  void handleSubmit() {
    print("click submit button");
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/login_screen/icon.png",
              width: 80.0,
              height: 80.0,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 20.0,),
            Center(
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 80.0,),
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                hintText: "Please input username",
                prefixIcon: Icon(Icons.person),
                fillColor: Colors.grey,
                filled: true,
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue
                  )
                )
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Please input password",
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.looks),
                fillColor: Colors.grey,
                filled: true,
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red
                  )
                )
              ),
              obscureText: true,
            ),
            SizedBox(height: 80.0,),
            RaisedButton(
              child: Text("Submit"),
              color: Colors.white,
              onPressed: handleSubmit,
            )
          ],
        ),
      )
    );
  }
}