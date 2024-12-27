import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class TujuanPembelajaranScreen extends StatefulWidget {
  final String img;
  TujuanPembelajaranScreen(this.img);

  @override
  State<TujuanPembelajaranScreen> createState() => _MyPdfViewerState();
}

class _MyPdfViewerState extends State<TujuanPembelajaranScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Tujuan Pembelajaran"),
        backgroundColor: Color(0xFF78D9F1),
      ),
      body: SfPdfViewer.asset("materials/tujuan pembelajaran.pdf"),
    );
  }
}
