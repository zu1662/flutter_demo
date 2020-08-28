import 'package:flutter/material.dart';

class EmailScreen extends StatefulWidget {
  EmailScreen({Key key}) : super(key: key);

  @override
  _EmailScreenState createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  int _count = 0;

  void _handleIncrement() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Email Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Now you can click the float btn."), Text("$_count", style: TextStyle(fontSize: 30),)],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: "Increment",
        onPressed: _handleIncrement,
      ),
    );
  }
}
