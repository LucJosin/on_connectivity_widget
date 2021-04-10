/*
Author: Lucas Josino
Github: https://github.com/LucasPJS
Package: on_connectivity_widget
Homepage: https://github.com/LucasPJS/on_connectivity_widget
Copyright: © 2021, Lucas Josino. All rights reserved.
License: https://github.com/LucasPJS/on_connectivity_widget/blob/main/LICENSE
*/

import 'package:flutter/material.dart';
import 'package:on_connectivity_widget/on_connectivity_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("OnConnectivityExample"),
        ),
        body: OnConnectivityWidget(
          animationDuration: Duration(seconds: 1),
          messageDuration: Duration(seconds: 2),
          position: PositionType.BOTTOM,
          showNoneUntilOnline: true,
          messageDurationWhenOnline: Duration(seconds: 2),
          animationType: Curves.bounceInOut,
          cancelInitState: false,
          wifiWidget: Container(
            height: 60,
            width: double.infinity,
            color: Colors.green,
            child: Center(child: Text("Wifi")),
          ),
          mobileWidget: Container(
            height: 60,
            width: double.infinity,
            color: Colors.blue,
            child: Center(child: Text("Mobile")),
          ),
          noneWidget: Container(
            height: 60,
            width: double.infinity,
            color: Colors.red,
            child: Center(child: Text("None")),
          ),
          //customAnimation: null,
          //customPosition: null,
        ),
      ),
    );
  }
}
