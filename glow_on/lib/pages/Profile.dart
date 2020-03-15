// import 'package:glow_on/pages/CustomJobTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glow_on/pages/JobDetails.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  PageController controller;
  List<Service> services = new List<Service>();

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
    int appBarHeight = 200;
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
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              // backgroundColor: Color(0xffF4F4F6),
              backgroundColor: Color(0xffffffff),
              elevation: 0,
              stretchTriggerOffset: 50,
              primary: true,
              stretch: true,
              pinned: true,
              expandedHeight: 100,
              title: Text("Profile",
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'OpenSans',
                      color: Colors.black,
                      fontWeight: FontWeight.w100)),
              // flexibleSpace: LayoutBuilder(
              //   builder: (BuildContext context, BoxConstraints constraints) {
              //     double percent = ((constraints.maxHeight - kToolbarHeight) *
              //         100 /
              //         (appBarHeight - kToolbarHeight));
              //     double dx = 0;

              //     dx = 100 - percent;
              //     if (constraints.maxHeight == 100) {
              //       dx = 0;
              //     }

              //     return Stack(
              //       children: <Widget>[
              //         Padding(
              //           padding: const EdgeInsets.only(
              //               top: kToolbarHeight / 4, left: 0.0),
              //           child: Transform.translate(
              //             child: Text(
              //               "Name",
              //               style: TextStyle(
              //                   color: Colors.black, fontFamily: "OpenSans"),
              //             ),
              //             offset: Offset(
              //                 dx, constraints.maxHeight - kToolbarHeight),
              //           ),
              //         ),
              //       ],
              //     );
              //   },
              // ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  ListTile(
                    leading: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {},
                      child: Container(
                        width: 100,
                        height: 100,
                        padding: EdgeInsets.symmetric(vertical: 4.0),
                        alignment: Alignment.centerLeft,
                        child: CircleAvatar(backgroundImage: NetworkImage('https://images.askmen.com/1080x540/2016/01/25-021526-facebook_profile_picture_affects_chances_of_getting_hired.jpg'),),
                      ),
                    ),
                    title: Text("",
                    textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'OpenSans',
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                    //          trailing: Icon(
                    //   Icons.keyboard_arrow_right,
                    //   color: Colors.black38,
                    // ),
                    dense: true,
                  ),
                  Divider(),
                  ListTile(
                    enabled: false,
                    title: Text("Account",
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'OpenSans',
                            color: Colors.black,
                            fontWeight: FontWeight.w700)),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Name",
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'OpenSans',
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                    subtitle: Text("Daniel",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'OpenSans',
                            color: Colors.black38,
                            fontWeight: FontWeight.normal)),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.black38,
                    ),
                    onTap: () {},
                  ),
                  Divider(),
                  ListTile(
                    title: Text("Email",
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'OpenSans',
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                    subtitle: Text("dan@vivllio.com",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'OpenSans',
                            color: Colors.black38,
                            fontWeight: FontWeight.normal)),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.black38,
                    ),
                    onTap: () {},
                  ),
                  Divider(),
                  ListTile(
                    enabled: true,
                    title: Text("Sign Out",
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'OpenSans',
                            color: Colors.red[300],
                            fontWeight: FontWeight.w400)),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Service {
  String id;
  String text;
  String image;
  Service({this.id, this.text, this.image});
}
