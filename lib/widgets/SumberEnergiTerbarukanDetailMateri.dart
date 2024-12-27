import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class SumberEnergiTerbarukanDetailMateri extends StatefulWidget {
  const SumberEnergiTerbarukanDetailMateri({super.key});

  @override
  State<SumberEnergiTerbarukanDetailMateri> createState() =>
      _MyPdfViewerState();
}

class _MyPdfViewerState extends State<SumberEnergiTerbarukanDetailMateri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Sumber Energi Terbarukan"),
      ),
      body: SfPdfViewer.asset("materials/sumber energi terbarukan.pdf"),
    );
  }
}
