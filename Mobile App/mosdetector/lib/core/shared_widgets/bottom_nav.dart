//bottom navigation bar
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  int index = 0;
  void onTap(int index) {
    this.index = index;
  }

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {

  //bottom navigation bar
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}