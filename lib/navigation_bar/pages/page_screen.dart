import 'package:flutter/material.dart';

class PageScreen extends StatefulWidget {
  PageScreen({Key key}) : super(key: key);

  @override
  _PageScreenState createState() => _PageScreenState();
}

class _PageScreenState extends State<PageScreen> with AutomaticKeepAliveClientMixin {
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
        title: Text("Page Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Now you can click the float btn."), Text("$_count", style: TextStyle(fontSize: 30),)],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        heroTag: "Page",
        tooltip: "IncrementPage",
        onPressed: _handleIncrement,
      ),
    );
  }
}
