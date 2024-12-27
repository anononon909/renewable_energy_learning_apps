import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HalamanKuis extends StatefulWidget {
  const HalamanKuis({super.key, required this.controller});

  final WebViewController controller;

  @override
  State<HalamanKuis> createState() => _HalamanKuisState();
}

class _HalamanKuisState extends State<HalamanKuis> {
  var loadingPercentage = 0;

  @override
  void initState() {
    super.initState();
    widget.controller
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              loadingPercentage = 0;
            });
          },
          onPageFinished: (url) {
            setState(() {
              loadingPercentage = 100;
            });
          },
        ),
      )
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel("SnackBar", onMessageReceived: (message) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(message.message)));
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebViewWidget(controller: widget.controller),
        if (loadingPercentage < 100)
          LinearProgressIndicator(
            value: loadingPercentage / 100.0,
          )
      ],
    );
  }
}
