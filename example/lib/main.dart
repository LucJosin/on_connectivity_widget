/*
=============
Author: Lucas Josino
Github: https://github.com/LucJosin
Website: https://www.lucasjosino.com/
=============
Plugin/Id: on_connectivity_widget#1
Homepage: https://github.com/LucJosin/on_connectivity_widget
Pub: https://pub.dev/packages/on_connectivity_widget
License: https://github.com/LucJosin/on_connectivity_widget/blob/main/LICENSE
Copyright: © 2022, Lucas Josino. All rights reserved.
=============
*/

import 'package:flutter/material.dart';
import 'package:on_connectivity_widget/on_connectivity_widget.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("OnConnectivityWidgetExample"),
        ),
        body: OnConnectivityWidget(
          animationDuration: const Duration(seconds: 1),
          messageDuration: const Duration(seconds: 2),
          position: SlidePositionType.BOTTOM,
          showNoneUntilOnline: true,
          messageDurationWhenOnline: const Duration(seconds: 2),
          animationType: Curves.bounceInOut,
          cancelInitState: false,
          // All default messages.
          bluetoothWidget: OnMessageWidget(
            title: 'You\'re online',
            desc: 'Your current connection is: Bluetooth',
            color: Colors.lightBlue[200]!,
            icon: Icons.check_circle_outline_rounded,
          ),
          wifiWidget: const OnMessageWidget(
            title: 'You\'re online',
            desc: 'Your current connection is: Wifi',
            color: Colors.green,
            icon: Icons.check_circle_outline_rounded,
          ),
          ethernetWidget: OnMessageWidget(
            title: 'You\'re online',
            desc: 'Your current connection is: Ethernet',
            color: Colors.lightGreen[200]!,
            icon: Icons.check_circle_outline_rounded,
          ),
          mobileWidget: const OnMessageWidget(
            title: 'You\'re online',
            desc: 'Your current connection is: Mobile',
            color: Colors.blue,
            icon: Icons.check_circle_outline_rounded,
          ),
          noneWidget: const OnMessageWidget(
            title: 'You\'re offline',
            desc: 'Your current connection is: Offline',
            color: Colors.red,
            icon: Icons.error_outline_rounded,
          ),
          //customAnimation: null,
          //customPosition: null,
        ),
      ),
    );
  }
}
