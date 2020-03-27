import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:glow_on/pages/Confirmation.dart';

class Discover extends StatefulWidget {
  const Discover({Key key}) : super(key: key);

  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  PageController controller;

  double screenHight;

  double screenWidth;

  @override
  void initState() {
    super.initState();

    controller = new PageController();
    // startSplashScreenTimer();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    screenHight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
     return MaterialApp(
      title: 'Backgroun Image',
      home: Scaffold(
          body: DecoratedBox(
              position: DecorationPosition.background,
              decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                    image: AssetImage('/Users/jennanewcomb/GlowOn/GlowOn/glow_on/assets/images/chair.jpg'),
                    fit: BoxFit.cover),
              ),
              child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 350, bottom: 0, left: 0, right: 0),
                  child: Center(
                  child: Text(
                    "Discover",
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              ),
              Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 0, left: 0, right: 0),
              child: Center(
                child: Text(
                  "GlowOn makes it easy to view and schedule appointments with your favorite artists and stylists.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 300, bottom: 0, left: 0, right: 0),
                child: DotsIndicator(
                  dotsCount: 3,
                  position: 1,
                    decorator: DotsDecorator(
                    color: Colors.grey[200],
                    activeColor: Colors.pink[300],
                  ),
                ),
              )
            ]
              ),
     )
     ));
  }
}
