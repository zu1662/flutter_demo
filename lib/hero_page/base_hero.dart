import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

/// Hero Widget其实是利用了补件动画
/// 两个尽量相似的Hero之间，使用同一个tag name来进行animation
/// 所以分为源hero与目标hero
/// 通过导入scheduler包中的timeDilation能够修改变化速度
/// 在源Hero的build函数中设定timeDilation值即可

class SourceHeroScreen extends StatefulWidget {
  SourceHeroScreen({Key key}) : super(key: key);

  @override
  _SourceHeroScreenState createState() => _SourceHeroScreenState();
}

class _SourceHeroScreenState extends State<SourceHeroScreen> {
  Hero _sourceHero = Hero(
    tag: "Hero Tag",
    child: Container(
      height: 100.0,
      width: 100.0,
      color: Colors.amberAccent,
    ),
  );
  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Source Page"),
      ),
      body: Center(
        child: GestureDetector(
          child: _sourceHero,
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => DestinationHeroScreen())),
        ),
      ),
    );
  }
}

class DestinationHeroScreen extends StatefulWidget {
  DestinationHeroScreen({Key key}) : super(key: key);

  @override
  _DestinationHeroScreenState createState() => _DestinationHeroScreenState();
}

class _DestinationHeroScreenState extends State<DestinationHeroScreen> {
  Hero _destinationHero = Hero(
    tag: 'Hero Tag',
    child: Container(
      height: 100.0,
      color: Colors.blue,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Destination Page"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              child: _destinationHero,
              onTap: () => Navigator.of(context).pop(),
            )
          ],
        ));
  }
}
