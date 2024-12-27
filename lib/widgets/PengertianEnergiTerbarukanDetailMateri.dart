import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PengertianEnergiTerbarukanDetailMateri extends StatefulWidget {
  const PengertianEnergiTerbarukanDetailMateri({super.key});

  @override
  State<PengertianEnergiTerbarukanDetailMateri> createState() =>
      _MyPdfViewerState();
}

class _MyPdfViewerState extends State<PengertianEnergiTerbarukanDetailMateri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Pengertian Energi Terbarukan"),
      ),
      body: SfPdfViewer.asset("materials/pengertian energi terbarukan.pdf"),
    );
  }
}
