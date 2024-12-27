import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renewable_energy_apps/content/1_peta_konsep.dart';
import 'package:renewable_energy_apps/content/2_1_ATP.dart';
import 'package:renewable_energy_apps/content/3_video_pembelajaran.dart';
import 'package:renewable_energy_apps/content/4_kuis.dart';
import 'package:renewable_energy_apps/content/5_1_halaman_proyek.dart';
import 'package:renewable_energy_apps/screens/1_PengertianEnergiTerbarukanCourseScreen.dart';
import 'package:renewable_energy_apps/screens/2_TujuanEnergiTerbarukanCourseScreen.dart';
import 'package:renewable_energy_apps/screens/3_SumberEnergiTerbarukanCourseScreen.dart';
import 'package:renewable_energy_apps/screens/4_ContohPenerapanCourseScreen.dart';
import 'package:renewable_energy_apps/screens/5_ManfaatEnergiTerbarukanCourseScreen.dart';
import 'package:renewable_energy_apps/screens/daftar_materi.dart';
import 'package:renewable_energy_apps/screens/kekurangan_energi_terbarukan.dart';
import 'package:renewable_energy_apps/screens/kelebihan_energi_terbarukan.dart';
import 'package:renewable_energy_apps/virtual_mentor/virtual_mentor_proto.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List catNames = [
    "Peta Konsep",
    "Tujuan Pembelajaran",
    "Video Pembelajaran",
    "Kuis",
    "Proyek",
  ];

  List<Color> catColors = [
    Color(0xFFFFCF2F),
    Color(0xFF6FE08D),
    Color(0xFF61BDFD),
    Color(0xFFFC7F7F),
    Color(0xFFCB84FB),
  ];

  List<Icon> CatIcons = [
    Icon(Icons.map, color: Colors.white, size: 30),
    Icon(Icons.flag, color: Colors.white, size: 30),
    Icon(Icons.play_circle_fill, color: Colors.white, size: 30),
    Icon(Icons.assignment, color: Colors.white, size: 30),
    Icon(Icons.build, color: Colors.white, size: 30),
  ];

  List imglist = [
    'Pengertian Energi Terbarukan',
    'Tujuan Energi Terbarukan',
    'Sumber Energi Terbarukan',
    'Contoh Penerapan',
    'Manfaat Energi Terbarukan',
    'Kelebihan Energi Terbarukan',
    'Kekurangan Energi Terbarukan'
  ];

  bool isSearchActive = false;

  final Controller = TextEditingController();
  List<Materi> DaftarMateri = allDaftarMateri;

  void searchMateri(String query) {
    final suggestions = allDaftarMateri.where((materi) {
      final materiTitle = materi.title.toLowerCase();
      final input = query.toLowerCase();
      return materiTitle.contains(input);
    }).toList();

    setState(() {
      DaftarMateri = suggestions;
      isSearchActive = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 15.h, left: 15.w, right: 15.w, bottom: 10.h),
            decoration: BoxDecoration(
              color: Color(0xFF78D9F1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.dashboard,
                      size: 30.sp,
                      color: Color(0xFF10465D),
                    ),
                    Icon(
                      Icons.add_home,
                      size: 30.sp,
                      color: Color(0xFF10465D),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.only(left: 3.w, bottom: 15.h),
                  child: Text(
                    "Hi, Students",
                    style: GoogleFonts.publicSans(
                      textStyle: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        wordSpacing: 2,
                        color: Color(0xFF10465D),
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 5.h,
                          bottom: 20.h,
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: 64.3.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: Controller,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20.w,
                                        vertical: 15.h,
                                      ),
                                      border: InputBorder.none,
                                      hintText:
                                          "Cari Disini....(e.g.Tujuan Energi Terbarukan)",
                                      hintStyle: TextStyle(
                                        color:
                                            Color(0xFF10465D).withOpacity(0.6),
                                        fontSize: 13.sp,
                                      ),
                                      prefixIcon: Icon(
                                        Icons.search,
                                        size: 25.sp,
                                      ),
                                    ),
                                    onChanged: searchMateri,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: () {
                                    Controller.clear();
                                    searchMateri('');
                                    setState(() {
                                      isSearchActive = false;
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                          ],
                        ),
                      ),
                      if (isSearchActive)
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: DaftarMateri.length,
                          itemBuilder: (context, index) {
                            final materi = DaftarMateri[index];
                            return ListTile(
                              leading: Image.asset(
                                materi.image,
                                fit: BoxFit.cover,
                                width: 10,
                                height: 10,
                              ),
                              title: Text(materi.title),
                              onTap: () {
                                switch (materi.title) {
                                  case 'Pengertian Energi Terbarukan':
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PengertianEnergiTerbarukanCourseScreen(
                                                "Pengertian Energi Terbarukan"),
                                      ),
                                    );
                                    break;
                                  case 'Tujuan Energi Terbarukan':
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            TujuanEnergiTerbarukanCourseScreen(
                                                "Tujuan Energi Terbarukan"),
                                      ),
                                    );
                                    break;
                                  case 'Sumber Energi Terbarukan':
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SumberEnergiTerbarukanCourseScreen(
                                                "Sumber Energi Terbarukan"),
                                      ),
                                    );
                                    break;
                                  case 'Contoh Penerapan Energi Terbarukan':
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ContohPenerapanCourseScreen(
                                                "Contoh Penerapan"),
                                      ),
                                    );
                                    break;
                                  case 'Manfaat Energi Terbarukan':
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ManfaatEnergiTerbarukanCourseScreen(
                                                "Manfaat Energi Terbarukan"),
                                      ),
                                    );
                                    break;
                                  case 'Kelebihan Energi Terbarukan':
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            KelebihanCourseScreen(
                                                "Kelebihan Energi Terbarukan"),
                                      ),
                                    );
                                    break;
                                  case 'Kekurangan Energi Terbarukan':
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            KekuranganCourseScreen(
                                                "Kekurangan Energi Terbarukan"),
                                      ),
                                    );
                                    break;
                                }
                              },
                            );
                          },
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h, left: 15.w, right: 15.w),
            child: Column(
              children: [
                GridView.builder(
                  itemCount: catNames.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.1,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        switch (catNames[index]) {
                          case "Peta Konsep":
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PetaKonsepScreen("Peta Konsep"),
                              ),
                            );
                            break;
                          case "Tujuan Pembelajaran":
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    AlurTujuanPembelajaranScreen(
                                        "Tujuan Pembelajaran"),
                              ),
                            );
                            break;
                          case "Video Pembelajaran":
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VideoPembelajaranScreen(),
                              ),
                            );
                            break;
                          case "Kuis":
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => KuisScreen(),
                              ),
                            );
                            break;
                          case "Proyek":
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FrontProyekScreen(),
                              ),
                            );
                            break;
                        }
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 55.h,
                            width: 55.w,
                            decoration: BoxDecoration(
                              color: catColors[index],
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: CatIcons[index],
                            ),
                          ),
                          Text(
                            catNames[index],
                            textAlign: TextAlign.center,
                            style: GoogleFonts.publicSans(
                              textStyle: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.7),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Materi",
                      style: GoogleFonts.publicSans(
                        textStyle: TextStyle(
                          fontSize: 23.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                GridView.builder(
                  itemCount: imglist.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio:
                        (MediaQuery.of(context).size.height - 30 - 80.h) /
                            (5 * 240),
                    mainAxisSpacing: 10.h,
                    crossAxisSpacing: 10.w,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        switch (imglist[index]) {
                          case 'Pengertian Energi Terbarukan':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PengertianEnergiTerbarukanCourseScreen(
                                        "Pengertian Energi Terbarukan"),
                              ),
                            );
                            break;
                          case 'Tujuan Energi Terbarukan':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    TujuanEnergiTerbarukanCourseScreen(
                                        "Tujuan Energi Terbarukan"),
                              ),
                            );
                            break;
                          case 'Sumber Energi Terbarukan':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SumberEnergiTerbarukanCourseScreen(
                                        "Sumber Energi Terbarukan"),
                              ),
                            );
                            break;
                          case 'Contoh Penerapan':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ContohPenerapanCourseScreen(
                                        "Contoh Penerapan"),
                              ),
                            );
                            break;
                          case 'Manfaat Energi Terbarukan':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ManfaatEnergiTerbarukanCourseScreen(
                                        "Manfaat Energi Terbarukan"),
                              ),
                            );
                            break;
                          case 'Kelebihan Energi Terbarukan':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => KelebihanCourseScreen(
                                    "Kelebihan Energi Terbarukan"),
                              ),
                            );
                            break;
                          case 'Kekurangan Energi Terbarukan':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => KekuranganCourseScreen(
                                    "Kekurangan Energi Terbarukan"),
                              ),
                            );
                            break;
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.h, horizontal: 10.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: Color(0xFFF5F3FF),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10.w),
                              child: Image.asset(
                                "images/${imglist[index]}.png",
                                width: 150.w,
                                height: 150.h,
                              ),
                            ),
                            Text(
                              imglist[index],
                              style: GoogleFonts.publicSans(
                                textStyle: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black.withOpacity(0.6),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        iconSize: 32.sp,
        selectedItemColor: Color(0xFF78D9F1),
        selectedFontSize: 18.sp,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble), label: "Virtual Mentor AI"),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VirtualMentor()),
            );
          }
        },
      ),
    );
  }
}
