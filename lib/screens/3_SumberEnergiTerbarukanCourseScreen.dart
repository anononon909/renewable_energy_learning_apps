import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renewable_energy_apps/screens/home_screen.dart';
import 'package:renewable_energy_apps/widgets/SumberEnergiTerbarukanDetailMateri.dart';
import 'package:renewable_energy_apps/virtual_mentor/virtual_mentor_proto.dart';

class SumberEnergiTerbarukanCourseScreen extends StatefulWidget {
  final String img;
  SumberEnergiTerbarukanCourseScreen(this.img);

  @override
  State<SumberEnergiTerbarukanCourseScreen> createState() =>
      _CourseScreenState();
}

class _CourseScreenState extends State<SumberEnergiTerbarukanCourseScreen> {
  List<Map<String, String>> sumberEnergiList = [
    {
      'judul': 'Biomassa',
      'deskripsi':
          'Biomassa adalah bahan organik yang berasal dari tumbuh-tumbuhan maupun hewan.',
      'gambar': 'biomassa.jpg',
    },
    {
      'judul': 'Panas Matahari',
      'deskripsi':
          'Matahari adalah sumber energi utama yang memancarkan energi yang luar biasa besarnya ke permukaan bumi. Pada keadaan cuaca cerah, permukaan bumi menerima sekitar 1000 Watt energi matahari per-meter persegi.',
      'gambar': 'matahari.jpg',
    },
    {
      'judul': 'Panas Bumi',
      'deskripsi':
          'Energi panas bumi merupakan sumber daya alam yang terbarukan dan ramah lingkungan. Prinsip kerja pembangkit geotermal hampir mirip dengan pembagkit tenaga uap yang mana panas yang keluar dari perut bumi langsung dipakai untuk memutar turbin generator sehingga menghasilkan energi litrik.',
      'gambar': 'panasbumi.jpg',
    },
    {
      'judul': 'Air',
      'deskripsi':
          'Air sebagai sumber energi alternatif salah satunya yaitu sebagai pembangkit listrik tenaga air (PLTA), sumber energi ini didapatkan dengan memanfaatkan energi potensial dan energi kinetik yang dimiliki oleh air',
      'gambar': 'air.jpg',
    },
    {
      'judul': 'Angin',
      'deskripsi':
          'Angin adalah pergerakan udara di atmosfer yang dapat digunakan untuk menghasilkan energi listrik melalui turbin angin. Sumber energi angin disebabkan oleh pemanasan sinar matahari yang tidak merata diatas permukaan bumi, sehingga mengakibatkan adanya perbedaan tekanan udara.',
      'gambar': 'angin.jpg',
    },
    {
      'judul': 'Nuklir',
      'deskripsi':
          'Energi nuklir dihasilkan melalui reaksi nuklir, seperti pemecahan inti atom atau penggabungan inti atom.',
      'gambar': 'nuklir.jpg',
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
              fontSize: ScreenUtil().setSp(18),
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
              padding: EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width,
              height: ScreenUtil().setHeight(200),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ScreenUtil().setWidth(20)),
                color: Color(0xFFEAE7FF),
              ),
              child: InteractiveViewer(
                boundaryMargin: EdgeInsets.all(ScreenUtil().setWidth(20)),
                minScale: 0.1,
                maxScale: 2.0,
                child: Image.asset(
                  "images/${widget.img}.png",
                  fit: BoxFit.contain,
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
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: sumberEnergiList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: ScreenUtil().setHeight(8)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'images/sumber/${sumberEnergiList[index]['gambar']}',
                              width: ScreenUtil().setWidth(100),
                              height: ScreenUtil().setHeight(100),
                            ),
                            SizedBox(width: ScreenUtil().setWidth(10)),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    sumberEnergiList[index]['judul']!,
                                    style: GoogleFonts.publicSans(
                                      textStyle: TextStyle(
                                        fontSize: ScreenUtil().setSp(16),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: ScreenUtil().setHeight(5)),
                                  Text(
                                    sumberEnergiList[index]['deskripsi']!,
                                    style: GoogleFonts.publicSans(
                                      textStyle: TextStyle(
                                        fontSize: ScreenUtil().setSp(14),
                                      ),
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: ScreenUtil().setHeight(20)),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SumberEnergiTerbarukanDetailMateri(),
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
        iconSize: ScreenUtil().setSp(32),
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
