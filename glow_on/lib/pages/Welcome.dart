import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:glow_on/pages/Home.dart';
// import 'package:glow_on_app/pages/Login.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
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
    return Container(
 
        child: Scaffold(
          body: ListView(
            //crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisSize: MainAxisSize.max,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Colors.white,
                height: screenHight / 1.25,
                child: PageIndicatorContainer(
                    child: PageView(
                      children: <Widget>[
                        _stepOneTour(),
                        _stepTwoTour(),
                        _stepThreeTour(),
                      ],
                      controller: controller,
                    ),
                    align: IndicatorAlign.bottom,
                    length: 3,
                    indicatorSpace: 5.0,
                    padding: const EdgeInsets.all(10),
                    indicatorColor: Colors.grey,
                    indicatorSelectorColor: Theme.of(context).primaryColor,
                    shape: IndicatorShape.circle(size: 8)),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: <Widget>[
                    SafeArea(
                      
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 50, right: 50, bottom: 10, top: 10),
                        child: Container(
                            height: 50,
                            child: new MaterialButton(
                                onPressed: () {
                                  //navigateToAddNotes();
                                },
                                color: Theme.of(context).primaryColor,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(50.0)),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text(
                                      "Sign Up",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ))),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                       
                    //     Navigator.of(context)
                    // .push(MaterialPageRoute(
                    //     builder: (BuildContext context) => LoginPage()));
                     Navigator.pushReplacementNamed(context, '/home');

                      },
                      child: Text(
                      "Login",
                      style: TextStyle(
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: Theme.of(context).primaryColor),
                    ),
                    )
                    
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }

  Widget _stepOneTour() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: screenHight / 10,
          ),
          Text(
            "glow_on",
            style: TextStyle(
                fontFamily: "OpenSans",
                fontWeight: FontWeight.w500,
                fontSize: 60,
                color: Theme.of(context).primaryColor),
          ),
          SizedBox(
            height: screenHight / 6,
          ),
          Text(
            "Welcome to glow_on",
            style: TextStyle(
                fontFamily: "OpenSans",
                 fontWeight: FontWeight.w500,
                fontSize: 25,
                color: Colors.black87),
          ),
          SizedBox(
            height: screenHight * 0.01,
          ),
          Text(
            "The App That Helps Work Work For You",
            textAlign: TextAlign.center,
            style: TextStyle(
              
                fontFamily: "OpenSans",
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _stepTwoTour() {
    double screenHight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: screenHight/7,),
              Padding(
                  padding: EdgeInsets.all(17),
                  child: Container(
                    height: screenHight / 7,
                    child: new Image.asset("assets/images/tools.png",
                        fit: BoxFit.cover),
                  )),
              Padding(
                padding: EdgeInsets.only(top: screenHight/10),
                child: Text(
                  "Jobs that fit your skills",
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                      color: Colors.black87),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Find Jobs that fit your skillset and your schedule.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.black87),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _stepThreeTour() {
    double screenHight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: screenHight/7,),
              Padding(
                  padding: EdgeInsets.all(17),
                  child: Container(
                    height: screenHight / 7,
                    child: new Image.asset("assets/images/resume.png",
                        fit: BoxFit.cover),
                  )),
              Padding(
                padding: EdgeInsets.only(top: screenHight/10),
                child: Text(
                  "Need A Job Done?",
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                      color: Colors.black87),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Find the right person for the job. Quickly post a job, negotiate a price, and get it done.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.black87),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }


  }
