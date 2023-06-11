import 'package:flutter/material.dart';
import 'package:mosdetector/core/shared_widgets/primary_button.dart';

import '../../../../core/shared_widgets/appBar.dart';
import '../../../../core/shared_widgets/bottom_nav.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/ui_converter.dart';

class ErrorScreen extends StatefulWidget {
  String message;
  String appBarText ;
  ErrorScreen({super.key, required this.message, required this.appBarText});

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CHSAppBar.build(context, widget.appBarText, (){}, true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const Image(image: AssetImage("assets/images/rafiki.png")),
            const SizedBox(height: 15,),
            Text(widget.message, style: const TextStyle(color: Colors.red),),
            const SizedBox(height: 30,),
            PrimaryButton(
                text: "Back To Home",
                backgroundColor: buttonColor,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNav()));
                  }, 
                height: UIConverter.getComponentHeight(context, 70),
                width: UIConverter.getComponentWidth(context, 200),
                fontFamily: "Urbanist",
                fontSize: 14,
                fontWeight: FontWeight.w500,
                textColor: mainTextColor,
                borderRadius: 12)
          ],
        ),
      ),
    );
  }
}