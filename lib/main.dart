import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:webinux/view/homescreen.dart';



void main(){

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter WebView Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const MyHomePage1(),
    );
  }
}


