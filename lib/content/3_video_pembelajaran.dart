import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:renewable_energy_apps/screens/home_screen.dart';

class VideoPembelajaranScreen extends StatefulWidget {
  const VideoPembelajaranScreen({Key? key}) : super(key: key);

  @override
  State<VideoPembelajaranScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoPembelajaranScreen> {
  final videoURL = "https://youtu.be/l2LGzo6InXQ?si=KJNdEz-cx3UWNeaB";

  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    final videoID = YoutubePlayer.convertUrlToId(videoURL);

    _controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Video Pembelajaran")),
      body: Padding(
        padding: const EdgeInsets.only(top: 200.0),
        child: Center(
          child: YoutubePlayerBuilder(
            player: YoutubePlayer(controller: _controller),
            builder: (context, player) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  player,
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        iconSize: 25,
        selectedItemColor: Color(0xFF78D9F1),
        selectedFontSize: 16,
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
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
