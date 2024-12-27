import 'package:flutter/material.dart';
import 'package:renewable_energy_apps/content/halaman_kuis.dart';
import 'package:webview_flutter/webview_flutter.dart';

class KuisScreen extends StatefulWidget {
  const KuisScreen({Key? key}) : super(key: key);

  @override
  State<KuisScreen> createState() => _KuisState();
}

class _KuisState extends State<KuisScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(
            "https://docs.google.com/forms/d/e/1FAIpQLSdWPiZvVALl3W4QtoKpWL1Y-c-_JZKXCD-SEj3HOP5llnJNfw/viewform?usp=sf_link"),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kuis"),
        actions: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () async {
                  final messenger = ScaffoldMessenger.of(context);
                  if (await controller.canGoBack()) {
                    await controller.goBack();
                  } else {
                    messenger.showSnackBar(
                        SnackBar(content: Text("No Back History Found")));

                    return;
                  }
                },
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () async {
                  final messenger = ScaffoldMessenger.of(context);
                  if (await controller.canGoForward()) {
                    await controller.goForward();
                  } else {
                    messenger.showSnackBar(
                        SnackBar(content: Text("No Back History Found")));

                    return;
                  }
                },
              ),
              IconButton(
                  onPressed: () {
                    controller.reload();
                  },
                  icon: Icon(Icons.replay))
            ],
          )
        ],
      ),
      body: HalamanKuis(
        controller: controller,
      ),
    );
  }
}
