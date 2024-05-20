
import 'package:get/get.dart';

import 'package:webview_flutter/webview_flutter.dart';

class WebViewController1 extends GetxController {
  late final WebViewController webViewController;


  var loadingPercentage = 0.obs;
  final String cacheKey = 'web_cache';

  @override
  void onInit() {
    super.onInit();
    webViewController = WebViewController();
    _setNavigationDelegate();
    webViewController.loadRequest(Uri.parse("https://webinuxs.com/")); 
  }

  void _setNavigationDelegate() {
    webViewController.setNavigationDelegate(
      NavigationDelegate(
        onPageStarted: (url) {
          loadingPercentage.value = 0;
        },
        onProgress: (progress) {
          loadingPercentage.value = progress;
        },
        onPageFinished: (url) async {
          loadingPercentage.value = 100;
          
              await webViewController.runJavaScriptReturningResult(
                  "document.documentElement.outerHTML");

        },
      ),
    );
    webViewController.setJavaScriptMode(JavaScriptMode.unrestricted);
    webViewController.addJavaScriptChannel("SnackBar",
        onMessageReceived: (message) {
      Get.snackbar('Message', message.message);
    });
  }

  Future<void> goBack() async {
    if (await webViewController.canGoBack()) {
      await webViewController.goBack();
    } else {
      Get.snackbar('Error', 'No Back History Found');
    }
  }

  Future<void> goForward() async {
    if (await webViewController.canGoForward()) {
      await webViewController.goForward();
    } else {
      Get.snackbar('Error', 'No Forward History Found');
    }
  }

  void reload() {
    webViewController.reload();
  }
}
