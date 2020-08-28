import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

/// 可以封装Hero进行统一Hero的设置。
/// InkWell包装图像，使得向源和目标英雄添加轻击手势变得非常简单。
/// 使用透明颜色定义“材质”窗口小部件可使图像在飞往目标时“弹出”背景。
/// SizedBox指定动画开始和结束时英雄的大小。
/// 将图像的fit属性设置为BoxFit.contain，可确保图像在过渡期间尽可能大，
/// 而不会更改其纵横比。

class SourceImageHeroScreen extends StatefulWidget {
  SourceImageHeroScreen({Key key}) : super(key: key);

  @override
  _SourceImageHeroScreenState createState() => _SourceImageHeroScreenState();
}

class _SourceImageHeroScreenState extends State<SourceImageHeroScreen> {

  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Source Page"),
      ),
      body: Center(
        child: PhotoHero(
          photo: 'http://pic1.win4000.com/wallpaper/e/537ebd9b60603.jpg',
          width: 100.0,
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => DestinationHeroScreen())),
        )
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Destination Page"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            PhotoHero(
              photo: 'http://pic1.win4000.com/wallpaper/e/537ebd9b60603.jpg',
              width: 300.0,
              onTap: () => Navigator.of(context).pop(),
            )
          ],
        ));
  }
}

class PhotoHero extends StatelessWidget {
  const PhotoHero({Key key, this.photo, this.width, this.onTap})
      : super(key: key);

  final String photo;
  final double width;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.network(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
