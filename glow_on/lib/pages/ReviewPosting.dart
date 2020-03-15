import 'dart:io';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glow_on/pages/Home.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moneytextformfield/moneytextformfield.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';

class ReviewPost extends StatefulWidget {
  const ReviewPost(
      //TODO: Add dates in unformated time 00-00-00-00...
      {Key key,
      @required this.service,
      this.location,
      this.description,
      this.images,
      this.date,
      this.time,
      this.price})
      : super(key: key);

//TODO: We may want to create an Object and populate it as we go?
  final Post service;
  //this could be an adress or a geolocation
  final String location;
  final String description;
  final List<Asset> images;
  final String date;
  final String time;
  final String price;

  @override
  _ReviewPostState createState() => _ReviewPostState();
}

class _ReviewPostState extends State<ReviewPost> {
  final _formKey = GlobalKey<FormState>();
  final homeScaffoldKey = GlobalKey<ScaffoldState>();
  final searchScaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController mycontroller = TextEditingController();



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
                      if (true) {
                        //Do the Next Thing
                      } else {}
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
                padding: EdgeInsets.all(20),
                child: Container()),
           
            ],
          ),
        ));
  }
}
