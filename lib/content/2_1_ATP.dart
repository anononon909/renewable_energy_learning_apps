import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renewable_energy_apps/content/2_tujuan_pembelajaran.dart';

class AlurTujuanPembelajaranScreen extends StatefulWidget {
  final String img;
  AlurTujuanPembelajaranScreen(this.img);

  @override
  State<AlurTujuanPembelajaranScreen> createState() =>
      _AlurTujuanPembelajaranState();
}

class _AlurTujuanPembelajaranState extends State<AlurTujuanPembelajaranScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Tujuan Pembelajaran"),
        backgroundColor: Color(0xFF78D9F1),
      ),
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              "images/Alur Tujuan Pembelajaran 2.png",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Positioned(
            bottom: 60.0.sp, // jarak dari bawah
            left: 0,
            right: 0,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        TujuanPembelajaranScreen('Tujuan Pembelajaran'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF628B1F),
              ),
              child: Text(
                'Detail Tujuan Pembelajaran',
                style: TextStyle(
                  color: Colors.white, // Warna teks tombol
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
