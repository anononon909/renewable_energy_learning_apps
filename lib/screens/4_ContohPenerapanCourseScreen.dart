import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renewable_energy_apps/screens/detail_gambar.dart';
import 'package:renewable_energy_apps/screens/home_screen.dart';
import 'package:renewable_energy_apps/widgets/ContohPenerapanDetailMateri.dart';
import 'package:renewable_energy_apps/virtual_mentor/virtual_mentor_proto.dart';

class ContohPenerapanCourseScreen extends StatefulWidget {
  final String img;
  ContohPenerapanCourseScreen(this.img);

  @override
  State<ContohPenerapanCourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<ContohPenerapanCourseScreen> {
  List<Map<String, String>> contohEnergiList = [
    {
      'judul': 'Panel Surya',
      'deskripsi':
          'Panel surya adalah perangkat rakitan sel-sel fotovoltaik yang mengkonversi sinar matahari menjadi listrik.',
      'gambar': 'panel_surya.jpg',
    },
    {
      'judul': 'Kincir Angin',
      'deskripsi':
          'Kincir angin menerapkan prinsip fisika, yaitu gerak melingkar. Salah satu implementasi konsep tersebut adalah pada rotor turbin yang berputar berlawanan arah. Kincir angin yang berputar saat digunakan tersebut akan menghasilkan listrik.',
      'gambar': 'kincir_angin.gif',
    },
    {
      'judul': 'Geothermal',
      'deskripsi':
          'geothermal berarti panas yang berasal dari bumi. Uap air (steam) dan air panas yang dihasilkan dari dalam bumi dapat digunakan untuk menghasilkan listik dan panas.',
      'gambar': 'geothermal.gif',
    },
    {
      'judul': 'Hydropower',
      'deskripsi':
          'Tenaga air (hydropower) adalah energi yang diperoleh dari air yang mengalir. Energi yang dimiliki air dapat dimanfaatkan dan digunakan dalam wujud energi mekanis maupun energi listrik.',
      'gambar': 'hydropower.gif',
    },
    {
      'judul': 'Biodiesel',
      'deskripsi':
          'Biodiesel adalah bahan bakar alternatif yang dihasilkan dari bahan alami yang terbarukan seperti minyak nabati dan hewani.',
      'gambar': 'biodiesel.jpg',
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
                    itemCount: contohEnergiList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailGambarScreen(
                                gambarPath:
                                    'images/contoh/${contohEnergiList[index]['gambar']}',
                                tag:
                                    'gambar$index', // Gunakan tag yang unik untuk setiap gambar
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Hero(
                                tag:
                                    'gambar$index', // Gunakan tag yang sama di sini
                                child: Image.asset(
                                  'images/contoh/${contohEnergiList[index]['gambar']}',
                                  width: 100.w,
                                  height: 100.h,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      contohEnergiList[index]['judul']!,
                                      style: GoogleFonts.publicSans(
                                        textStyle: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    Text(
                                      contohEnergiList[index]['deskripsi']!,
                                      style: GoogleFonts.publicSans(
                                        textStyle: TextStyle(
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                    SizedBox(
                                        height: 5
                                            .h), // Tambahkan jarak antara teks dan catatan
                                    Text(
                                      '(Klik gambar untuk melihat tampilan yang lebih jelas)', // Catatan untuk menampilkan tampilan yang lebih jelas
                                      style: GoogleFonts.publicSans(
                                        textStyle: TextStyle(
                                          fontSize: 12.sp,
                                          color:
                                              Colors.grey, // Warna teks catatan
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20.h),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ContohPenerapanDetailMateri(),
                          ),
                        );
                      },
                      child: Text('Lihat Detail Materi'),
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
