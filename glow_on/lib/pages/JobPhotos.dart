import 'dart:io';
import 'dart:async';

import 'package:glow_on/pages/JobDates.dart';
import 'package:flutter/material.dart';
import 'package:glow_on/pages/Home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:glow_on/Utils/CustomDialog.dart';

class JobPhotos extends StatefulWidget {
  const JobPhotos(
      {Key key, @required this.service, this.location, this.description})
      : super(key: key);

//TODO: We may want to create an Object and populate it as we go?
  final Post service;
  //this could be an adress or a geolocation
  final String location;
  final String description;

  @override
  _JobPhotosState createState() => _JobPhotosState();
}

class _JobPhotosState extends State<JobPhotos> {
  final _formKey = GlobalKey<FormState>();
  final homeScaffoldKey = GlobalKey<ScaffoldState>();
  final searchScaffoldKey = GlobalKey<ScaffoldState>();
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
                      Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => JobDates(
                                  service: widget.service,
                                  location: widget.location,
                                  description:widget.description,
                                  images: images,
                                )));
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
                  "Tap to Add Photots",
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
                      EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
                  child: Center(
                    child: Tooltip(
                      message: "Select photos",
                      child: Container(
                        height: screenWidth / 4,
                        width: screenWidth / 4,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius:
                                  10.0, // as the effect of softening the shadow
                              spreadRadius:
                                  2.0, // has the effect of extending the shadow
                            )
                          ],
                          borderRadius:
                              new BorderRadius.all(Radius.circular(9)),
                        ),
                        child: FlatButton(
                          onPressed: () {
                            // getImage();
                            loadAssets();
                          },
                          child: Container(
                            child: FittedBox(
                                fit: BoxFit.cover,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Icon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.black87,
                                  ),
                                )),
                          ),
                        ),
                      ),
                    ),
                  )),

              images != null
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: getimageWidgets(images),
                      ),
                    )
                  : Container(),
              // Column(
              //   children: <Widget>[
              //     Center(child: Text('Error: $_error')),
              //     RaisedButton(
              //       child: Text("Pick images"),
              //       onPressed: loadAssets,
              //     ),
              //     Expanded(
              //       child: buildGridView(),
              //     )
              //   ],
              // ),
              // Text(
              //   "Don't add photos",
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //       fontFamily: "OpenSans",
              //       fontWeight: FontWeight.w200,
              //       fontSize: 15,
              //       color: Colors.black45,
              //       decorationStyle: TextDecorationStyle.solid,
              //       decoration: TextDecoration.underline),
              // ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Select up to 5 photos",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "OpenSans",
                    fontWeight: FontWeight.w200,
                    fontSize: 15,
                    color: Colors.black87,
                    decorationStyle: TextDecorationStyle.solid,
                  ),
                ),
              )
            ],
          ),
        ));
  }

  // Future getImage() async {
  //   var image = await ImagePicker.pickImage(source: ImageSource.gallery);

  //   setState(() {
  //     _image = image;
  //   });
  // }

  Future<void> loadAssets() async {
    List<Asset> tempList;
    setState(() {
      tempList = images;
      images = List<Asset>();
    });

    List<Asset> resultList;
    String error;

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 5,
      );
    } on Exception catch (e) {
      error = "test";
      //if the user cancels their selection, set the images back to the temp list
      setState(() => images = tempList);
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      if (error == null) _error = 'No Error Dectected';
    });
  }

  Widget getimageWidgets(List<Asset> assets) {
    return new Wrap(
        children: images
            .map((item) => Container(
                  padding: EdgeInsets.all(4),
                  child: new AssetThumb(
                    asset: item,
                    width: 100,
                    height: 100,
                  ),
                ))
            .toList());
  }

  List<Widget> getMyImages() {
    List assets;
    for (Asset a in images) {
      assets.add(AssetThumb(
        asset: a,
        width: 300,
        height: 300,
      ));

      return assets;
    }
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }
}
