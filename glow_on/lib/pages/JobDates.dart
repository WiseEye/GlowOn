import 'dart:io';
import 'dart:async';

import 'package:glow_on/pages/JobPrice.dart';
import 'package:glow_on/pages/JobPrice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glow_on/pages/Home.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:glow_on/Utils/CustomDialog.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';

class JobDates extends StatefulWidget {
  const JobDates(
      {Key key,
      @required this.service,
      this.location,
      this.description,
      this.images})
      : super(key: key);

//TODO: We may want to create an Object and populate it as we go?
  final Post service;
  //this could be an adress or a geolocation
  final String location;
  final String description;
  final List<Asset> images;

  @override
  _JobDatesState createState() => _JobDatesState();
}

class _JobDatesState extends State<JobDates> {
  final homeScaffoldKey = GlobalKey<ScaffoldState>();
  final searchScaffoldKey = GlobalKey<ScaffoldState>();
  Color unselectedColor;
  Color selectedColor;
  String date = "Date";
  String time = "Time";
  String dateNotSet = "Date";
  String timeNotSet = "Time";
  String timeUnformated;
  String dateUnformated;
  String dateDefault;

  List<Asset> images;
  String _error;
  // File _image;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        key: homeScaffoldKey,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
            title: Text(
              widget.service.text,
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
                fontFamily: "OpenSans",
                fontWeight: FontWeight.w100,
              ),
            )),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 10, bottom: 20, left: 20, right: 20),
            child: Container(
                height: 50,
                child: new MaterialButton(
                    onPressed: () {
                      if (date != dateNotSet && time != timeNotSet) {
                         Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => JobPrice(
                                  service: widget.service,
                                  location: widget.location,
                                  description: widget.description,
                                  images: widget.images,
                                  date: date,
                                  time: time,
                                )));
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => CustomDialog(
                            title: "",
                            description: "Please select a date and time",
                            buttonText: "Okay",
                          ),
                        );
                      }
                    },
                    color: Theme.of(context).primaryColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(9.0)),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          "Next",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ))),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Padding(
                padding:
                    EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
                child: Text(
                  "Select a Date and Time",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.w100,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
              Center(
                child: new FlatButton(
                  onPressed: () {
                    CupertinoRoundedDatePicker.show(
                      context,
                      fontFamily: "OpenSans",
                      textColor: Colors.white,
                      background: Colors.blue[300],
                      borderRadius: 16,
                      initialDatePickerMode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (newDateTime) {
                        setState(() {
                          date = DateFormat.yMEd().format(newDateTime);
                        });
                      },
                    );
                  },
                  child: Text(
                    date,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.w400,
                      fontSize: 30,
                      color: Colors.black87,
                      decorationStyle: TextDecorationStyle.solid,
                    ),
                  ),
                ),
              ),
              Center(
                child: new FlatButton(
                  onPressed: () {
                    CupertinoRoundedDatePicker.show(
                      context,
                      fontFamily: "OpenSans",
                      textColor: Colors.white,
                      background: Colors.blue[300],
                      borderRadius: 16,
                      initialDatePickerMode: CupertinoDatePickerMode.time,
                      onDateTimeChanged: (newDateTime) {
                        setState(() {
                          time = DateFormat().add_jm().format(newDateTime);
                          // time = "$hour:$minuets";
                        });
                      },
                    );
                  },
                  child: Text(
                    time,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.w400,
                      fontSize: 30,
                      color: Colors.black87,
                      decorationStyle: TextDecorationStyle.solid,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
