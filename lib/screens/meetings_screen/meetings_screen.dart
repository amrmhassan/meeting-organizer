// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:meeting_organizer/constants/colors.dart';
import 'package:meeting_organizer/screens/meetings_screen/finished/finished.dart';
import 'package:meeting_organizer/screens/meetings_screen/upcoming/upcoming.dart';

class MeetingsScreen extends StatefulWidget {
  const MeetingsScreen({super.key});
  @override
  State<MeetingsScreen> createState() => _MeetingsScreen();
}

class _MeetingsScreen extends State<MeetingsScreen> {
  final List<Widget> screens = [
    Finished(),
    Upcoming(),
  ];
  var radius = Radius.circular(20);
  int initialIndex = 1;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: new AppBar(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            backgroundColor: kPrimaryColor,
            flexibleSpace: new Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                new TabBar(
                  indicatorColor: Colors.white,
                  labelStyle: TextStyle(fontSize: 22),
                  tabs: [
                    new Tab(
                      text: 'Finished',
                    ),
                    new Tab(
                      text: 'Upcoming',
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: TabBarView(children: screens),
        ));
  }
}
