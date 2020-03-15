// import 'package:glow_on/pages/CustomJobTitle.dart';
import 'package:glow_on/pages/Profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glow_on/pages/Home.dart';

import 'package:glow_on/pages/JobDetails.dart';

class BottomNavigationBarController extends StatefulWidget {
  @override
  _BottomNavigationBarControllerState createState() =>
      _BottomNavigationBarControllerState();
}

class _BottomNavigationBarControllerState
    extends State<BottomNavigationBarController> {
  final List<Widget> pages = [
    Home(
      key: PageStorageKey('Page1'),
    ),
    Profile(
      key: PageStorageKey('Page2'),
    ),
    Profile(
      key: PageStorageKey('Page2'),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  int _selectedIndex = 0;

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
        onTap: (int index) => setState(() => _selectedIndex = index),
        unselectedItemColor: Colors.grey[500],
        currentIndex: selectedIndex,
        backgroundColor: Colors.white,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.search),
            title: Text(
              '',
              style: TextStyle(
                fontFamily: "OpenSans",
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          new BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.home),
            title: Text('',
                style: TextStyle(
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.w500,
                )),
          ),
          new BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.user),
              title: Text('',
                  style: TextStyle(
                    fontFamily: "OpenSans",
                    fontWeight: FontWeight.w500,
                  )))
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PageStorage(
        child: pages[_selectedIndex],
        bucket: bucket,
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController controller;
  List<Post> services = new List<Post>();

  Post s1 = Post(
      text: "",
      image: "assets/images/hair_photo1.png",
      numComments: "10",
      numLikes: "100",
      posterName: "Jill Smith",
      salonName: "Jill's Salon",
      posterProfilePhoto: "assets/images/avatar1.png",
      timePosted: "2 hours ago");
  Post s2 = Post(
      text: "",
      image: "assets/images/hair_photo2.png",
      numComments: "10",
      numLikes: "100",
      posterName: "January Brown",
      salonName: "January Cuts",
      posterProfilePhoto: "assets/images/avatar2.png",
      timePosted: "1 hours ago");

  double screenHight;

  double screenWidth;

  @override
  void initState() {
    super.initState();

    services.add(s1);
    services.add(s2);

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
      // appBar: AppBar(
      //   title: Text("ListView"),
      // ),
      // backgroundColor: Color(0xffF4F4F6),
      backgroundColor: Color(0xffffffff),
      body: Container(
        // margin: EdgeInsets.all(8),
        child: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                // backgroundColor: Color(0xffF4F4F6),
                backgroundColor: Color(0xffffffff),
                elevation: 0,
                stretchTriggerOffset: 50,
                primary: true,
                stretch: false,
                centerTitle: false,
                title: Container(
                  // height: 50,
                  // width: 52,
                  decoration: BoxDecoration(
                    image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new AssetImage("assets/images/logo.png"),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(18.0)),
                    //color: Colors.redAccent,
                  ),
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.bars, //color: Color(0xff6E78F7)
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    // InkWell(
                    //   child: Container(
                    //     margin: EdgeInsets.only(
                    //         left: 20, right: 20, bottom: 20, top: 20),
                    //     //color: Colors.white,
                    //     height: 50,
                    //     decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       boxShadow: [
                    //         BoxShadow(
                    //           color: Colors.black12,
                    //           blurRadius:
                    //               10.0, // as the effect of softening the shadow
                    //           spreadRadius:
                    //               1, // has the effect of extending the shadow
                    //         )
                    //       ],
                    //       borderRadius:
                    //           new BorderRadius.all(Radius.circular(9)),
                    //     ),
                    //     child: Row(
                    //       children: <Widget>[
                    //         Padding(
                    //           padding: EdgeInsets.only(left: 15, right: 10),
                    //           child: Icon(
                    //             Icons.search,
                    //             color: Theme.of(context).primaryColor,
                    //           ),
                    //         ),
                    //         Expanded(
                    //           child: Text(
                    //             "Search for a service",
                    //             style: TextStyle(
                    //                 fontFamily: "OpenSans",
                    //                 fontWeight: FontWeight.w200,
                    //                 fontSize: 15,
                    //                 color: Colors.black38),
                    //           ),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              SliverPadding(
                  padding: EdgeInsets.all(10),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        // To convert this infinite list to a list with three items,
                        // uncomment the following line:
                        // if (index > 3) return null;
                        return Container(
                          height: screenHight / 1.7,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                new BorderRadius.all(Radius.circular(0)),
                          ),
                          child: Column(
                            children: <Widget>[
                              //The row that has the posters info

                              ListTile(
                                leading: GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {},
                                  child: Container(
                                    width: 50,
                                    height: 100,
                                    padding:
                                        EdgeInsets.symmetric(vertical: 0.0),
                                    alignment: Alignment.centerLeft,
                                    child: CircleAvatar(
                                        backgroundImage: new AssetImage(
                                            services[index].posterProfilePhoto)
                                        //TODO: We will need to make this a network image once we add in the database
                                        // NetworkImage(
                                        //     'https://images.askmen.com/1080x540/2016/01/25-021526-facebook_profile_picture_affects_chances_of_getting_hired.jpg'

                                        ),
                                  ),
                                ),
                                //poster's name
                                title: Text(services[index].posterName,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'OpenSans',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400)),
                                //posters salon / buisness name
                                subtitle: Text(services[index].salonName,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'OpenSans',
                                        color: Colors.grey[400],
                                        fontWeight: FontWeight.w400)),

                                //time post was created
                                trailing: Text(services[index].timePosted,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'OpenSans',
                                        color: Colors.grey[400],
                                        fontWeight: FontWeight.w400)),
                                dense: false,
                              ),

                              Container(
                                margin: EdgeInsets.all(10),
                                // width: 100.0,
                                height: screenHight / 2.5,
                                decoration: BoxDecoration(
                                  image: new DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        new AssetImage(services[index].image),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18.0)),
                                  //color: Colors.redAccent,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(FontAwesomeIcons.heart),
                                    ),
                                    //number of likes
                                    Text(services[index].numLikes,
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'OpenSans',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600)),
                                    //num comments
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(FontAwesomeIcons.comment),
                                    ),
                                    Text(services[index].numComments,
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'OpenSans',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600))
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      // Or, uncomment the following line:
                      childCount: services.length,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class Post {
  String id = "";
  String text = "";
  String image = "";
  String numComments = "";
  String numLikes = "";
  String posterName = "";
  String posterProfilePhoto = "";
  String salonName = "";
  String timePosted = "";
  Post(
      {this.id,
      this.text,
      this.image,
      this.numComments,
      this.numLikes,
      this.posterName,
      this.posterProfilePhoto,
      this.salonName,
      this.timePosted});
}
