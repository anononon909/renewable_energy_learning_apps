import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renewable_energy_apps/screens/home_screen.dart';
import 'package:renewable_energy_apps/virtual_mentor/virtual_mentor_proto.dart';

class ManfaatEnergiTerbarukanCourseScreen extends StatefulWidget {
  final String img;
  ManfaatEnergiTerbarukanCourseScreen(this.img);

  @override
  State<ManfaatEnergiTerbarukanCourseScreen> createState() =>
      _CourseScreenState();
}

class _CourseScreenState extends State<ManfaatEnergiTerbarukanCourseScreen> {
  List<Map<String, String>> manfaatEnergiList = [
    {
      'judul':
          'Energi Alternatif mampu menggantikan penggunaan batu bara yang dapat mengakibatkan pemanasan global.',
    },
    {
      'judul':
          'Energi Alternatif dapat mengalihkan bahan kimia menjadi energi listrik,sehingga tidak perlu melalui proses pembakaran yang menghasilkan karbondioksida dan berbagai emisi gas lainnya.',
    },
    {
      'judul':
          'Dapat dimanfaatkan untuk propane, methanol, etanol, gas alam, hidrogen, bensin, dan menjadi gas yang dapat diperbarui.',
    },
    {
      'judul':
          'Energi matahari dapat dibuat menjadi panel surya yang berfungsi untuk menangkap energi panas.',
    },
    {
      'judul':
          'Energi angin dapat dirubah menjadi energi listrik, dengan memanfaatkan perputaran baling-baling.',
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
          children: [
            Container(
              padding: EdgeInsets.all(5.w),
              width: MediaQuery.of(context).size.width,
              height: 200.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: Color(0xFFEAE7FF),
              ),
              child: InteractiveViewer(
                boundaryMargin: EdgeInsets.all(20.0),
                minScale: 0.1,
                maxScale: 2.0,
                child: Image.asset(
                  "images/${widget.img}.png",
                  fit: BoxFit.contain,
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
                    itemCount: manfaatEnergiList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${index + 1}.",
                              style: GoogleFonts.publicSans(
                                  textStyle: TextStyle(
                                fontSize: 14.0.sp,
                              )),
                            ),
                            SizedBox(width: 8.0),
                            Expanded(
                              child: Text(
                                manfaatEnergiList[index]['judul']!,
                                style: GoogleFonts.publicSans(
                                  textStyle: TextStyle(
                                    fontSize: 14.sp,
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
        iconSize: 32.sp,
        selectedItemColor: Color(0xFF78D9F1),
        selectedFontSize: 18.sp,
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
