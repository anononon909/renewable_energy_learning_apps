import 'package:flutter/material.dart';
import 'package:renewable_energy_apps/screens/welcome_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        home: WelcomeScreen(),
      ),
      designSize: const Size(360, 640),
    );
  }
}
