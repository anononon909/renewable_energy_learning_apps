import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renewable_energy_apps/screens/home_screen.dart';
import 'package:renewable_energy_apps/widgets/PengertianEnergiTerbarukanDetailMateri.dart';
import 'package:renewable_energy_apps/virtual_mentor/virtual_mentor_proto.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PengertianEnergiTerbarukanCourseScreen extends StatefulWidget {
  final String img;
  PengertianEnergiTerbarukanCourseScreen(this.img);

  @override
  State<PengertianEnergiTerbarukanCourseScreen> createState() =>
      _CourseScreenState();
}

class _CourseScreenState extends State<PengertianEnergiTerbarukanCourseScreen> {
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
                    "Energi terbarukan adalah sumber-sumber energi yang tidak akan pernah habis meski dipakai dalam jumlah berapa pun. Hal ini dikarenakan sumber energi terbarukan berasal dari alam melalui proses alamiah yang berkelanjutan. Energi terbarukan berasal dari elemen-elemen alam yang tersedia di bumi dalam jumlah besar dan merupakan sumber energi paling bersih yang tersedia di planet ini.",
                    style: GoogleFonts.publicSans(
                      textStyle: TextStyle(
                        fontSize: ScreenUtil().setSp(14),
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
                                PengertianEnergiTerbarukanDetailMateri(),
                          ),
                        );
                      },
                      child: Text('Lihat Detail Materi'),
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(20)),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        iconSize: ScreenUtil().setWidth(25),
        selectedItemColor: Color(0xFF78D9F1),
        selectedFontSize: ScreenUtil().setSp(16),
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
            // Navigasi ke home_screen.dart
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
