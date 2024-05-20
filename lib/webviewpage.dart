import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webinux/controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatelessWidget {
  const MyWebView({super.key});

  @override
  Widget build(BuildContext context) {
    final webViewController = Get.put(WebViewController1());

    return Obx(() {
      return Stack(
        children: [
          WebViewWidget(controller: webViewController.webViewController),
          if (webViewController.loadingPercentage.value < 100)
            LinearProgressIndicator(
              value: webViewController.loadingPercentage.value / 100.0,
            ),
        ],
      );
    });
  }
}

