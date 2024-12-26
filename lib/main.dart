import 'package:flutter/material.dart';
import 'package:spacesystem/home/home.dart';
import 'package:spacesystem/informationScreen/info.dart';
import 'package:spacesystem/informationScreen/models_3d.dart';
import 'package:spacesystem/log_inScreen/login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      Login.routeName: (_) => const Login(),
      Home.routeName: (_) => Home(),
      InformationScreen.routeName: (_) => InformationScreen(),
     // MyHomePage.routeName: (_) => MyHomePage(),
    },
    initialRoute: Login.routeName, // Replace with your main widget
  ));
}

