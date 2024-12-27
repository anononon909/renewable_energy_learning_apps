import 'package:flutter/material.dart';

class DetailGambarScreen extends StatelessWidget {
  final String gambarPath;
  final String tag;

  const DetailGambarScreen({
    required this.gambarPath,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(
            context); // Kembali ke layar sebelumnya ketika gambar ditekan
      },
      child: Scaffold(
        body: Center(
          child: Hero(
            tag: tag, // Gunakan tag yang sama di sini
            child: Image.asset(gambarPath),
          ),
        ),
      ),
    );
  }
}
