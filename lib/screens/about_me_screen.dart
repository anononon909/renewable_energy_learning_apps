import 'package:flutter/material.dart';

class AboutMeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('About Me'),
        ),
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('images/Aditya Samastha.jpg'),
              ),
              SizedBox(height: 20),
              Text(
                'Nama: Aditya Samastha',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              Text(
                'NIM: 4201420078',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              Text(
                'Prodi: Pendidikan Fisika',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
