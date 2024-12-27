import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renewable_energy_apps/content/5_proyek.dart';

class FrontProyekScreen extends StatelessWidget {
  const FrontProyekScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(375, 812),
    );

    final Color backgroundColor = Colors.white;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Proyek',
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        backgroundColor: Color(0xFF78D9F1),
      ),
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              "images/front proyek.png",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.all(20.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProyekScreen()),
                    );
                  },
                  icon: Icon(
                    Icons.play_circle_fill,
                    size: 100.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
