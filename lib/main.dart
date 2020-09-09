import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:water_tap/screens/control.dart';
import 'package:water_tap/screens/register_screen.dart';
import 'package:water_tap/screens/welcome.dart';

import 'screens/stream.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => {runApp(WaterTapApp())});
}
class WaterTapApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Player Demo',
      initialRoute: '/',
      routes: {
        '/': (context)=> WelcomPage(),
        '/register': (context) => RegisterPage(),
        '/stream': (context) => VideoPlayerScreen(),
        '/control': (context) => ControlCenter(),
        
      },
    );
  }
}