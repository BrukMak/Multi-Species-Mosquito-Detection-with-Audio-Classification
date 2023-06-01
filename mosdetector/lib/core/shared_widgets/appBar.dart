import 'package:flutter/material.dart';

class CHSAppBar {
  static PreferredSizeWidget build(
      BuildContext context, String text, Function onPressed, bool hasPop) {
    return AppBar(
      foregroundColor: Colors.white,
      shadowColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios_new,
              color: hasPop ? Colors.white : Colors.black),
        ),
          
          
        centerTitle: true,
        title: Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),

        backgroundColor: Colors.white);
  }
}
