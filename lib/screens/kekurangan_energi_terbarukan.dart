import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renewable_energy_apps/screens/home_screen.dart';
import 'package:renewable_energy_apps/virtual_mentor/virtual_mentor_proto.dart';

class KekuranganCourseScreen extends StatefulWidget {
  final String img;
  KekuranganCourseScreen(this.img);

  @override
  State<KekuranganCourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<KekuranganCourseScreen> {
  List<Map<String, String>> kekuranganEnergiList = [
    {
      'judul':
          'Dibutuhkan biaya yang besar untuk memanfaatkan energi alternatif.',
    },
    {
      'judul':
          'Dibutuhkan teknologi tinggi dan pemikiran yang rumit untuk memanfaatkan energi alternatif.',
    },
    {
      'judul':
          'Ketersedia beberapa sumber energi terbarukan terlalu dipengaruhi oleh musim.',
    },
    {
      'judul':
          'Langkanya sumber daya manusia yang ahil dan terampil, serta sumber energi terbarukan yang menunjang pengembangan energi terbarukan.',
    },
    {
      'judul':
          'Masih diperlukannya suku cadang impor sehingga menambah biaya produksi',
    },
    {
      'judul':
          'Kurangnya peran serta lembaga-lembaga baik swasta maupun pemerintah dalam pengembangan teknologi tepat guna.',
    },
  ];

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
              padding: EdgeInsets.all(5.w),
              width: MediaQuery.of(context).size.width,
              height: 200.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: Color(0xFFEAE7FF),
                image: DecorationImage(
                  image: AssetImage("images/${widget.img}.png"),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: kekuranganEnergiList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${index + 1}.",
                              style: GoogleFonts.publicSans(
                                textStyle: TextStyle(
                                  fontSize:
                                      14.sp, // Use ScreenUtil to set font size
                                ),
                              ),
                            ),
                            SizedBox(
                                width: 10.w), // Use ScreenUtil to set width
                            Expanded(
                              child: Text(
                                kekuranganEnergiList[index]['judul']!,
                                style: GoogleFonts.publicSans(
                                  textStyle: TextStyle(
                                    fontSize: 14
                                        .sp, // Use ScreenUtil to set font size
                                  ),
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        iconSize: 32.sp, // Use ScreenUtil to set icon size
        selectedItemColor: Color(0xFF78D9F1),
        selectedFontSize: 18.sp, // Use ScreenUtil to set font size
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
            // Navigate to home_screen.dart
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
