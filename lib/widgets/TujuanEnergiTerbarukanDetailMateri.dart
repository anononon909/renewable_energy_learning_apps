import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class TujuanEnergiTerbarukanDetailMateri extends StatefulWidget {
  const TujuanEnergiTerbarukanDetailMateri({super.key});

  @override
  State<TujuanEnergiTerbarukanDetailMateri> createState() =>
      _MyPdfViewerState();
}

class _MyPdfViewerState extends State<TujuanEnergiTerbarukanDetailMateri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Tujuan Energi Terbarukan"),
      ),
      body: SfPdfViewer.asset("materials/tujuan energi terbarukan.pdf"),
    );
  }
}
