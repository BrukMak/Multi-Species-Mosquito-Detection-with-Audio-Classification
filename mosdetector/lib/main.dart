import 'package:flutter/material.dart';
import 'package:mosdetector/features/core/splash_screen.dart';
import 'package:mosdetector/features/mosqiuto/presentation/screens/home.dart';
import 'package:mosdetector/features/mosqiuto/presentation/screens/recent_activity_page.dart';

import 'features/mosqiuto/presentation/screens/mosqiuto_detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SplashScreeen(),
      color: Colors.white,
    );
  }
}
