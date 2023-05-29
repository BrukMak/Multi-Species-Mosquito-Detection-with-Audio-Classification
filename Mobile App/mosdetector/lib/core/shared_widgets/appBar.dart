import 'package:flutter/material.dart';

class CHSAppBar {
  static PreferredSizeWidget build(
      BuildContext context, String text, Function onPressed, bool hasPop) {
    return AppBar(
        leading: GestureDetector(
          onTap: onPressed(),
          child: Icon(Icons.arrow_back,
              color: hasPop ? Colors.white : Colors.black),
        ),
        centerTitle: true,
        title: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),

        backgroundColor: Theme.of(context).primaryColor);
  }
}
