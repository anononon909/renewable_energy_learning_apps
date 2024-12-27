import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renewable_energy_apps/screens/home_screen.dart';
import 'package:renewable_energy_apps/virtual_mentor/virtual_mentor_proto.dart';

class KelebihanCourseScreen extends StatefulWidget {
  final String img;
  KelebihanCourseScreen(this.img);

  @override
  State<KelebihanCourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<KelebihanCourseScreen> {
  bool isIntiMateri = true;

  List<Map<String, String>> kelebihanEnergiList = [
    {
      'judul':
          'Dapat digunakan terus menerus karena tidak akan habis sehingga tidak akan terjadi kelangkaan energi.',
    },
    {
      'judul':
          'Ramah lingkungan karena tidak menghasilkan limbah yang membahayakan lingkungan dalam jangka waktu yang panjang,kecuali nuklir.',
    },
    {
      'judul':
          'Sumber energi gratis karena bisa didapatkan secara cuma-cuma, hanya memerlukan biaya awal pemasangan saja.',
    },
    {
      'judul':
          'Energi yang dapat dihasilkan sangat besar, pasokan melimpah karena energi didapatkan dari alam, maka pasokan akan selalu ada tergantung lokasinya.',
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
                    itemCount: kelebihanEnergiList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${index + 1}.",
                              style: GoogleFonts.publicSans(
                                textStyle: TextStyle(
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Text(
                                kelebihanEnergiList[index]['judul']!,
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
