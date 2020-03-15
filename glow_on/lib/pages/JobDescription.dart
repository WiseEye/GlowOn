import 'package:glow_on/pages/JobPhotos.dart';
import 'package:flutter/material.dart';
import 'package:glow_on/pages/Home.dart';
import 'package:glow_on/Utils/CustomDialog.dart';

class JobDescription extends StatefulWidget {
  const JobDescription({Key key, @required this.service, this.location}) : super(key: key);

  final Post service;
  //this could be an adress or a geolocation
  final String location;

  @override
  _JobDescriptionState createState() => _JobDescriptionState();
}

class _JobDescriptionState extends State<JobDescription> {
  final _formKey = GlobalKey<FormState>();
  final homeScaffoldKey = GlobalKey<ScaffoldState>();
  final searchScaffoldKey = GlobalKey<ScaffoldState>();
  String description;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                      if(_formKey.currentState.validate())
                      {
                       Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => JobPhotos(
                                  service: widget.service,
                                  location: widget.location,
                                  description:description,
                                )));
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
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                child: Text(
                  "Please Describe the job",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.w100,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 15),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    autocorrect: true,
                    autofocus: true,
                    scrollPhysics: ClampingScrollPhysics(),
                    textInputAction: TextInputAction.done,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: "OpenSans", fontSize: 20),
                    maxLength: 500,
                    maxLengthEnforced: true,
                    maxLines: 10,
                    decoration: new InputDecoration.collapsed(
                        hintText: "Job Description",
                        hintStyle: TextStyle(
                            fontSize: 20,
                            fontFamily: "OpenSans",
                            color: Colors.black38)),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please describe your job";
                      } else
                      {
                        setState(() {
                          description = value;
                        });
                         return null;
                      }
                       
                    },
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
