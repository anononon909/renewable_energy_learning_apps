import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renewable_energy_apps/screens/home_screen.dart';
import 'package:renewable_energy_apps/widgets/TujuanEnergiTerbarukanDetailMateri.dart';
import 'package:renewable_energy_apps/virtual_mentor/virtual_mentor_proto.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TujuanEnergiTerbarukanCourseScreen extends StatefulWidget {
  final String img;
  TujuanEnergiTerbarukanCourseScreen(this.img);

  @override
  State<TujuanEnergiTerbarukanCourseScreen> createState() =>
      _CourseScreenState();
}

class _CourseScreenState extends State<TujuanEnergiTerbarukanCourseScreen> {
  bool isIntiMateri = true;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.img,
          style: GoogleFonts.publicSans(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Color(0xFF78D9F1),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(ScreenUtil().setWidth(5)),
              width: MediaQuery.of(context).size.width,
              height: ScreenUtil().setHeight(200),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ScreenUtil().setWidth(20)),
                color: Color(0xFFEAE7FF),
                image: DecorationImage(
                  image: AssetImage("images/${widget.img}.png"),
                ),
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(20)),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: ScreenUtil().setHeight(10)),
                  Text(
                    "Tujuan utama dari dibuatnya energi alternatif adalah untuk mengganti energi yang berasal dari bahan bakar fosil. Oleh sebab itu, energi alternatif mulai dikembangkan oleh manusia, baik itu oleh masyarakat secara individu atau oleh industri.",
                    style: GoogleFonts.publicSans(
                      textStyle: TextStyle(
                        fontSize: ScreenUtil().setSp(14),
                      ),
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(10)),
                    child: Center(
                      child: Image.asset(
                        'images/tujuan/transisi energi.jpg',
                        width: ScreenUtil().setWidth(200),
                      ),
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(20)),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TujuanEnergiTerbarukanDetailMateri(),
                          ),
                        );
                      },
                      child: Text(
                        'Lihat Detail Materi',
                        style: GoogleFonts.publicSans(
                          textStyle: TextStyle(
                            fontSize: ScreenUtil().setSp(16),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        iconSize: ScreenUtil().setWidth(32),
        selectedItemColor: Color(0xFF78D9F1),
        selectedFontSize: ScreenUtil().setSp(18),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: "Virtual Mentor AI",
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else {
            if (index == 1) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => VirtualMentor()),
              );
            }
          }
        },
      ),
    );
  }
}
