import 'dart:io';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glow_on/pages/Home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moneytextformfield/moneytextformfield.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import 'ReviewPosting.dart';

class JobPrice extends StatefulWidget {
  const JobPrice(
      //TODO: Add dates in unformated time 00-00-00-00...
      {Key key,
      @required this.service,
      this.location,
      this.description,
      this.images,
      this.date,
      this.time})
      : super(key: key);

//TODO: We may want to create an Object and populate it as we go?
  final Post service;
  //this could be an adress or a geolocation
  final String location;
  final String description;
  final List<Asset> images;
  final String date;
  final String time;

  @override
  _JobPriceState createState() => _JobPriceState();
}

class _JobPriceState extends State<JobPrice> {
  final _formKey = GlobalKey<FormState>();
  final homeScaffoldKey = GlobalKey<ScaffoldState>();
  final searchScaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController mycontroller = TextEditingController();
  String price = "";

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
                    enableFeedback: true,
                    disabledColor: Color(0x520752FF),
                    onPressed: !isValidPrice(price) 
                        ? null
                        : () {
                            
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) => ReviewPost(
                                      service: widget.service,
                                      location: widget.location,
                                      description: widget.description,
                                      images: widget.images,
                                      date: widget.date,
                                      time: widget.time,
                                      price: price)));
                            
                              
                            
                          },
                    color: Theme.of(context).primaryColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(9.0)),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          "Review",
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
                  "Set a price for your job",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.w100,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: MoneyTextFormField(
                    settings: MoneyTextFormFieldSettings(
                        appearanceSettings: AppearanceSettings(
                            labelText: "Job Cost",
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontFamily: "OpenSans",
                                fontSize: 25,
                                fontWeight: FontWeight.w600),
                            formattedStyle: TextStyle(
                                fontFamily: "OpenSans",
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                            inputStyle: TextStyle(
                                fontFamily: "OpenSans",
                                fontSize: 20,
                                fontWeight: FontWeight.w500)),
                        onChanged: () {
                          setState(() {
                            price = mycontroller.text;
                          });
                        },
                        controller: mycontroller)),
              ),
            ],
          ),
        ));
  }

  bool isValidPrice(String price)
  {
    if(double.tryParse(price) == null)
    {
      return false;
    }
    else if(double.tryParse(price) == 0.0 )
    {
      return false;
    }
    else
    {
      return true;
    }

  }
}
