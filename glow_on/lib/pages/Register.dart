// import 'package:glow_on/pages/CustomJobTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glow_on/pages/Home.dart';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
    return Scaffold(
        backgroundColor: Colors.pink[200],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                "Are you ready to get your GlowOn?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                //maxLength: 10,
                maxLines: 1,
                minLines: 1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    //labelText: "Phone number",
                    focusColor: Colors.white,
                    fillColor: Colors.white,
                    hintText: "Username",
                    contentPadding:
                        EdgeInsets.all(5), //  <- you can it to 0.0 for no space
                    isDense: true,
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))
                    //border: InputBorder.none
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
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
                    contentPadding:
                        EdgeInsets.all(5), //  <- you can it to 0.0 for no space
                    isDense: true,
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))
                    //border: InputBorder.none
                    ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 10, bottom: 20, left: 20, right: 20),
              child: Container(
                  height: 50,
                  child: new MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                BottomNavigationBarController()));
                      },
                      color: Theme.of(context).primaryColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(9.0)),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                            "Custom Order",
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
        ));
  }
}
