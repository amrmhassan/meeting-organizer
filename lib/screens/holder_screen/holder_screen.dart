// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:meeting_organizer/constants/colors.dart';
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
        backgroundColor: kPrimaryColor,
        title: Center(
            child: Text(
          titles[initIndex],
          style: TextStyle(
            fontSize: 22,
          ),
        )),
        actions: [
          CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage('assets/icons/person.png'),
          )
        ],
      ),
      body: screens[initIndex],
      bottomNavigationBar: CircleNavBar(
        activeIcons: [
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
        color: kPrimaryColor,
        height: 60,
        circleWidth: 55,
        initIndex: 1,
        onChanged: (v) {
          setState(() {
            initIndex = v;
          });
        },
        shadowColor: kPrimaryColor,
        elevation: 10,
      ),
    );
  }
}
