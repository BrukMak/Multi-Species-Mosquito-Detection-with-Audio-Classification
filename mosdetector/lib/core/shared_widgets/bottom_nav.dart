//bottom navigation bar
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mosdetector/core/utils/colors.dart';

import '../../features/core/tutorial_page.dart';
import '../../features/mosqiuto/presentation/bloc/mosqiuto_bloc.dart';
import '../../features/mosqiuto/presentation/screens/home.dart';
import '../../features/mosqiuto/presentation/screens/recent_activity_page.dart';

class BottomNav extends StatefulWidget {

  List<Widget> pages = [
    HomePage(),
    RecentPage(),
    TutorialPage(),

  ];
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
    return Scaffold(
      body: widget.pages[widget.index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.index,
        selectedItemColor: Colors.black,
        showSelectedLabels: true,
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        selectedIconTheme: const IconThemeData(color: buttonColor),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (int i) {
          if (i == 1) {
              BlocProvider.of<MosqiutoBloc>(context).add(MosquitoGetMosquitoesEvent());
          } 
          
          setState(() {
            widget.index = i;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.recent_actors), label: 'Recents'),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_sharp), label: 'Tutorial'),
        ],
      ),
    );
  }
}