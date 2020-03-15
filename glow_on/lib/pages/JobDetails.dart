import 'package:glow_on/pages/JobDescription.dart';
import 'package:flutter/material.dart';
import 'package:glow_on/pages/Home.dart';
import 'package:google_maps_webservice/places.dart';
import 'dart:async';
import 'package:glow_on/Utils/CustomDialog.dart';
import 'package:flutter_google_places/flutter_google_places.dart';

// const kGoogleApiKey = "AIzaSyAhanY7OZwOSevd-iB_fTnnIs76IZDi9qo";
const kGoogleApiKey = "AIzaSyBKN-RuqAEvs1Tp9QecRrkonPT62JCZMyw";
GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

class JobDetails extends StatefulWidget {
  const JobDetails({Key key, @required this.service}) : super(key: key);

  final Post service;

  @override
  _JobDetailsState createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  final homeScaffoldKey = GlobalKey<ScaffoldState>();
  final searchScaffoldKey = GlobalKey<ScaffoldState>();

  String searchBarText;
  String address = "";
  String previousAdress = "123 glow_on Way";
  bool hideSearchBar = false;
  bool addressSelected = false;

  @override
  void initState() {
    searchBarText = "Pick An Address";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Mode _mode = Mode.overlay;
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
                      if (addressSelected) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => JobDescription(
                                  service: widget.service,
                                  location: searchBarText,
                                )));
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => CustomDialog(
                            title: "",
                            description:
                                "Please select an address or location for your job",
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
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                child: Text(
                  "Where do you need this service?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
              hideSearchBar
                  ? Container()
                  : InkWell(
                      onTap: () async {
                        setState(() {
                          hideSearchBar = true;
                        });
                        //  Future<void> _handlePressButton() async {
                        // show input autocomplete with selected mode
                        // then get the Prediction selected
                        Prediction p = await PlacesAutocomplete.show(
                            context: context,
                            apiKey: kGoogleApiKey,
                            onError: onError,
                            mode: _mode,
                            language: "en",
                            overlayBorderRadius: BorderRadius.circular(9)
                            // TODO: set this from the user location
                            //components: [Component(Component.country, "en")],
                            );
                        //     .then((value) {
                        //   setState(() {
                        //     hideSearchBar = false;
                        //   });
                        // });

                        displayPrediction(p, homeScaffoldKey.currentState)
                            .then((value) {
                          setState(() {
                            hideSearchBar = false;
                          });
                        });
//  }
                        // Prediction p = await PlacesAutocomplete.show(
                        //     context: context, apiKey: kGoogleApiKey);
                        // displayPrediction(p);
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 20, right: 20, bottom: 20, top: 20),
                        //color: Colors.white,
                        clipBehavior: Clip.hardEdge,
                        height: 50,

                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius:
                                  5.0, // as the effect of softening the shadow
                              spreadRadius:
                                  1.0, // has the effect of extending the shadow
                            )
                          ],
                          borderRadius:
                              new BorderRadius.all(Radius.circular(9)),
                        ),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 15, right: 10),
                              child: Icon(
                                Icons.search,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                searchBarText,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontWeight: FontWeight.w200,
                                    fontSize: 15,
                                    color: Colors.grey),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
              Center(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      searchBarText = previousAdress;
                    });
                  },
                  child: Text(
                    // "Use previous address " +
                    //     previousAdress +
                    "\n Use Current Location",
                    style: TextStyle(
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.w200,
                        fontSize: 15,
                        color: Colors.black38,
                        decorationStyle: TextDecorationStyle.solid,
                        decoration: TextDecoration.underline),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  void onError(PlacesAutocompleteResponse response) {
    homeScaffoldKey.currentState.showSnackBar(
      SnackBar(content: Text(response.errorMessage)),
    );
  }

  Future<Null> displayPrediction(Prediction p, ScaffoldState scaffold) async {
    if (p != null) {
      // get detail (lat/lng)
      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId);
      final lat = detail.result.geometry.location.lat;
      final lng = detail.result.geometry.location.lng;
      setState(() {
        searchBarText = p.description;
        addressSelected = true;
      });

      scaffold.showSnackBar(
          // SnackBar(content: Text("${p.description} - $lat/$lng")),
          SnackBar(content: Text("${p.description}")));
    }
  }
}
