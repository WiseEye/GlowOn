import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glow_on/pages/Loginglowon.dart';

class Confirmation extends StatefulWidget {
  const Confirmation({Key key}) : super(key: key);

  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
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
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20, left: 0, right: 20),
              child: Center(
                child: Text(
                  "Success!",
                  style: TextStyle(
                    color: Colors.pink[300],
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(
                child: Text(
                  "A confirmation code has been sent to random@gmail.com",
                  style: TextStyle(
                    color: Colors.pink[300],
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.left,
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
                    hintText: "Confirmation Code",
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    contentPadding:
                        EdgeInsets.all(5), //  <- you can it to 0.0 for no space
                    isDense: true,
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[500])),
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
                                Login()));
                      },
                      color: Theme.of(context).primaryColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(9.0)),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                            "Submit",
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
