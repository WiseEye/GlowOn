import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "glow_on",
              style: TextStyle(
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.w800,
                  fontSize: 50,
                  color: Theme.of(context).primaryColor),
            )
          ],
        ),
      ),
    );
  }
}
