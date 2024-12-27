import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renewable_energy_apps/screens/home_screen.dart';
import 'package:renewable_energy_apps/virtual_mentor/virtual_mentor_proto.dart';
import 'package:url_launcher/url_launcher.dart';

class ProyekScreen extends StatefulWidget {
  const ProyekScreen({Key? key}) : super(key: key);

  @override
  State<ProyekScreen> createState() => _ProyekScreenState();
}

class _ProyekScreenState extends State<ProyekScreen> {
  List<Map<String, String>> indikatorTujuanList = [
    {
      'judul':
          'Peserta didik dapat mengidentifikasi masalah ketersediaan energi yang ada di sekitar.',
    },
    {
      'judul':
          'Peserta didik dapat menganalisis pemecahan masalah yang mungkin untuk mengatasi keterbatasan energi yang ada di sekitar.',
    },
    {
      'judul':
          'Peserta didik dapat merancang produk pernghasil energi sebagai pemecahan masalah keterbatasan energi yang ada di sekitar.',
    },
  ];

  List<Map<String, String>> petunjukPengerjaanList = [
    {
      'judul': 'Jawabah pertanyaan pemantik sebelum mengerjakan LKPD.',
    },
    {
      'judul':
          'Saksikan dan pahami video pembelajaran yang terdapat pada aplikasi.',
    },
    {
      'judul':
          'Eksplorasi dari berbagai sumber termasuk dengan menggunakan chatbot, mengenai solusi pemecahan masalah yang didiskusikan.',
    },
    {
      'judul':
          'Rancanglah desain produk, alat dan bahan, serta langkah pembuatan dari solusi permasalahan yang diperoleh.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(375, 812),
    );

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
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(0.0),
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
                ),
                child: InteractiveViewer(
                  boundaryMargin: EdgeInsets.all(20.0),
                  minScale: 0.1,
                  maxScale: 2.0,
                  child: Image.asset(
                    "images/Group Project.png",
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
                    SizedBox(height: 20.h),
                    Text(
                      'Tujuan Proyek:',
                      style: GoogleFonts.publicSans(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Menganalisis permasalahan terkait keterbatasan energi dan menjadikan energi terbarukan sebagai solusinya.",
                      style: GoogleFonts.publicSans(
                        fontSize: 16.sp,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Indikator Tujuan Pembelajaran:',
                      style: GoogleFonts.publicSans(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.zero,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: indikatorTujuanList.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${index + 1}.",
                                      style: GoogleFonts.publicSans(
                                        textStyle: TextStyle(
                                          fontSize: 16
                                              .sp, // Use ScreenUtil to set font size
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        width: 10
                                            .w), // Use ScreenUtil to set width
                                    Expanded(
                                      child: Text(
                                        indikatorTujuanList[index]['judul']!,
                                        style: GoogleFonts.publicSans(
                                          textStyle: TextStyle(
                                            fontSize: 16
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
                    SizedBox(height: 20.h),
                    Text(
                      'Petunjuk Pengerjaan LKPD:',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.zero,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: petunjukPengerjaanList.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${index + 1}.",
                                      style: GoogleFonts.publicSans(
                                        textStyle: TextStyle(
                                          fontSize: 16
                                              .sp, // Use ScreenUtil to set font size
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        width: 10
                                            .w), // Use ScreenUtil to set width
                                    Expanded(
                                      child: Text(
                                        petunjukPengerjaanList[index]['judul']!,
                                        style: GoogleFonts.publicSans(
                                          textStyle: TextStyle(
                                            fontSize: 16
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
                    SizedBox(height: 10.h),
                    ElevatedButton(
                      onPressed: () {
                        _launchURL();
                      },
                      child: Text('Unduh LKPD'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
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

  void _launchURL() async {
    const url =
        'https://docs.google.com/document/d/1NuJHVW9wI551-iyyQAVzqg4RoVdwqvzA/edit?usp=sharing&ouid=108714343998936075258&rtpof=true&sd=true';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
