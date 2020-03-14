import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';

class HomeFeed extends StatefulWidget {
  @override
  _HomeFeedState createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeed> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
              icon: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.menu,
                  color: Colors.black,
                  size: 30,
                ),
              ),
              onPressed: () {
                print("lol");
              },
            )
          ],
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: <Widget>[
                Text(
                  "GlowOn",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.pink[200]),
                ),
              ],
            ),
          )),
      body: Container(),
    );
  }
}
