import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dots_indicator/dots_indicator.dart';


class Explore extends StatefulWidget {
  const Explore({Key key}) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
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
                    image: AssetImage('/Users/jennanewcomb/GlowOn/GlowOn/glow_on/assets/images/nails.jpg'),
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
                    "Explore",
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
                  position: 0,
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
   /*  return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(
                child: Text(
                  "Are you ready to get your GlowOn?",
                  style: TextStyle(
                    color: Colors.pink[300],
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            
          ],
        )); */
  }
}
