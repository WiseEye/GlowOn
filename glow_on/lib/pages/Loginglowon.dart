import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glow_on/pages/swipepage.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                    image: AssetImage('/Users/jennanewcomb/GlowOn/GlowOn/glow_on/assets/images/face.png'),
                    fit: BoxFit.cover),
              ),
              child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
               children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 350, bottom: 0, left: 0, right: 150),
              child: Center(
                child: Text(
                  "GlowOn",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 55,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
 Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 30, left: 30, right: 155),
              child: TextField(
                //maxLength: 10,
                maxLines: 1,
                minLines: 1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    //labelText: "Phone number",
                    hintText: "Username",
                    hintStyle: TextStyle(color: Colors.white),
                    contentPadding:
                        EdgeInsets.all(5), //  <- you can it to 0.0 for no space
                    isDense: true,
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))
                    //border: InputBorder.none
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 30, left: 30, right: 155),
              child: TextField(
                //maxLength: 10,
                maxLines: 1,
                minLines: 1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    //labelText: "Phone number",
                    focusColor: Colors.white,
                    fillColor: Colors.white,
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.white),
                    contentPadding:
                        EdgeInsets.all(5), //  <- you can it to 0.0 for no space
                    isDense: true,
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))
                    //border: InputBorder.none
                    ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top:20, bottom:10, left:30, right:150),
              child: Container(
                  height: 40,
                  child: new MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                Swipe()));
                      },
                      color: Theme.of(context).primaryColor.withOpacity(0.7),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(9.0)),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ))),
            )
          ],
        ),
        ),
        ));
  }
}