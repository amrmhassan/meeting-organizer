// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:meeting_organizer/screens/groups_screen/groups_screen.dart';
import 'package:meeting_organizer/screens/home_screen/home_screen.dart';
import 'package:meeting_organizer/screens/meetings_screen/meetings_screen.dart';

class HolderScreen extends StatefulWidget {
  const HolderScreen({super.key});

  @override
  State<HolderScreen> createState() => _HolderScreenState();
}

class _HolderScreenState extends State<HolderScreen> {
  int initIndex = 1;

  final List<Widget> screens = [
    GroupsScreen(),
    HomeScreen(),
    MeetingsScreen(),
  ];

  final List<String> titles = ['Groups', 'Home', 'Meetings'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        backgroundColor: const Color(0xff7C80FF),
        title: Center(
            child: Text(
          titles[initIndex],
          style: TextStyle(
            fontSize: 22,
          ),
        )),
        actions: const [
          CircleAvatar(
            radius: 22,
            backgroundImage: NetworkImage(
                'https://cdn1.iconfinder.com/data/icons/user-pictures/101/malecostume-512.png'),
          )
        ],
      ),
      body: screens[initIndex],
      bottomNavigationBar: CircleNavBar(
        activeIcons: const [
          Icon(Icons.group, color: Colors.white),
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.call_rounded, color: Colors.white),
        ],
        inactiveIcons: titles
            .map((e) => Text(
                  e,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ))
            .toList(),
        color: const Color(0xff7C80FF),
        height: 60,
        circleWidth: 55,
        initIndex: 1,
        onChanged: (v) {
          setState(() {
            initIndex = v;
          });
        },
        shadowColor: Color(0xff7C80FF),
        elevation: 10,
      ),
    );
  }
}
