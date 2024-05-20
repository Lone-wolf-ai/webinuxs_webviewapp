import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webinux/webviewpage.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyHomePage1 extends StatelessWidget {
  const MyHomePage1({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WebViewController());

    return  Scaffold(
      backgroundColor: Colors.orange[500],
      body: const SafeArea(child: MyWebView()),
    );
  }
}
