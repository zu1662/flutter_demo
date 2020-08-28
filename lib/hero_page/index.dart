import 'package:flutter/material.dart';

import 'package:flutter/material.dart' show Scaffold;
// import 'package:flutter_demo/hero_page/base_hero.dart';
import 'package:flutter_demo/hero_page/image_hero.dart';

class HeroScreenIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SourceImageHeroScreen(),
    );
  }
}
