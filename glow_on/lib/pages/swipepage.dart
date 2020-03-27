import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glow_on/pages/explore.dart';
import 'package:glow_on/pages/Achieve.dart';
import 'package:glow_on/pages/Discover.dart';

class Swipe extends StatefulWidget {
  @override
  _Swipe createState() => _Swipe();
}

class _Swipe extends State<Swipe> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: [
        Explore(),
        Discover(),
        Achieve(),
      ],
    );
  }
}