import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ContohPenerapanDetailMateri extends StatefulWidget {
  const ContohPenerapanDetailMateri({super.key});

  @override
  State<ContohPenerapanDetailMateri> createState() => _MyPdfViewerState();
}

class _MyPdfViewerState extends State<ContohPenerapanDetailMateri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Contoh Energi Terbarukan"),
      ),
      body: SfPdfViewer.asset("materials/contoh energi terbarukan.pdf"),
    );
  }
}
