import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mosdetector/core/shared_widgets/primary_button.dart';
import 'package:mosdetector/core/utils/ui_converter.dart';
import 'package:mosdetector/features/mosqiuto/presentation/bloc/mosqiuto_bloc.dart';

import '../../core/shared_widgets/bottom_nav.dart';
import '../../core/utils/colors.dart';
import '../../core/utils/images.dart';
import '../mosqiuto/presentation/screens/home.dart';

class SplashScreeen extends StatefulWidget {
  const SplashScreeen({super.key});

  @override
  State<SplashScreeen> createState() => _SplashScreeenState();
}

class _SplashScreeenState extends State<SplashScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 9, right: 9, top: 117, bottom: 58),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Mos Detector",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Updock"),
            ),
            SizedBox(
              height: UIConverter.getComponentHeight(context, 51),
            ),
            Image(
              image: const AssetImage("assets/images/splash.png",
                            ),              height: UIConverter.getComponentHeight(context, 418),
              width: UIConverter.getComponentWidth(context, 415),
            ),
            SizedBox(
              height: UIConverter.getComponentHeight(context, 120),
            ),
            PrimaryButton(
                text: "Get Started",
                backgroundColor: buttonColor,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNav()));
                  },
                height: UIConverter.getComponentHeight(context, 70),
                width: UIConverter.getComponentWidth(context, 348),
                fontFamily: "Urbanist",
                fontSize: 18,
                fontWeight: FontWeight.w500,
                textColor: mainTextColor,
                borderRadius: 12)
          ],
        ),
      ),
    );
  }
}
