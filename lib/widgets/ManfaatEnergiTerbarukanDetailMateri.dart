import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ManfaatEnergiTerbarukanDetailMateri extends StatefulWidget {
  const ManfaatEnergiTerbarukanDetailMateri({super.key});

  @override
  State<ManfaatEnergiTerbarukanDetailMateri> createState() =>
      _MyPdfViewerState();
}

class _MyPdfViewerState extends State<ManfaatEnergiTerbarukanDetailMateri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Manfaat Energi Terbarukan"),
      ),
      body: SfPdfViewer.asset("manfaat energi terbarukan"),
    );
  }
}
