import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renewable_energy_apps/screens/home_screen.dart';
import 'about_me_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: ScreenUtil().setHeight(812) / 1.6,
                  decoration: BoxDecoration(
                    color: Color(0xFF6D9826),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: ScreenUtil().setHeight(812) / 1.6,
                  padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(100)),
                  decoration: BoxDecoration(
                    color: Color(0xFFE1F9FF),
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(80)),
                  ),
                  child: Center(
                    child: Image.asset(
                      "images/renewable-energy.png",
                      scale: 0.5,
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: ScreenUtil().setHeight(812) / 2.666,
                decoration: BoxDecoration(
                  color: Color(0xFFE1F9FF),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: ScreenUtil().setHeight(812) / 2.666,
                padding: EdgeInsets.only(top: 30, bottom: 10),
                decoration: BoxDecoration(
                  color: Color(0xFF6D9826),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(70),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      "Energi Terbarukan",
                      style: GoogleFonts.publicSans(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(25),
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                          wordSpacing: 2,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(20)),
                      child: Text(
                        "Mari bersama-sama menjelajahi keajaiban energi terbarukan, karena di sana kita akan temukan kekuatan untuk menciptakan perubahan positif untuk dunia.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.publicSans(
                          textStyle: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: ScreenUtil().setSp(13),
                            letterSpacing: 1,
                            wordSpacing: 1,
                          ),
                        ),
                        maxLines: 5,
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(10)),
                    Material(
                      color: Color(0xFFE1F9FF),
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: ScreenUtil().setHeight(15),
                              horizontal: ScreenUtil().setWidth(60)),
                          child: Text(
                            "Get Start",
                            style: GoogleFonts.publicSans(
                              textStyle: TextStyle(
                                color: Color(0xFF004969),
                                fontSize: ScreenUtil().setSp(22),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(10)),
                    Material(
                      color: Color(0xFFE1F9FF),
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AboutMeScreen(),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: ScreenUtil().setHeight(5),
                              horizontal: ScreenUtil().setWidth(20)),
                          child: Text(
                            "About Me",
                            style: GoogleFonts.publicSans(
                              textStyle: TextStyle(
                                color: Color(0xFF004969),
                                fontSize: ScreenUtil().setSp(14),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
