// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:meeting_organizer/constants/colors.dart';
import 'package:meeting_organizer/constants/fake_data.dart';
import 'package:meeting_organizer/helper/authentication.dart';
import 'package:meeting_organizer/providers/meeting_provider.dart';
import 'package:meeting_organizer/screens/groups_screen/groups_screen.dart';
import 'package:meeting_organizer/screens/holder_screen/component/iconAdd.dart';
import 'package:meeting_organizer/screens/home_screen/home_screen.dart';
import 'package:meeting_organizer/screens/meetings_screen/meetings_screen.dart';
import 'package:provider/provider.dart';

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
  void initState() {
    Future.delayed(Duration.zero).then((value) {
      //? loading the fake data to the app
      Provider.of<MeetingsProvider>(context, listen: false).getMeetings();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.menu),
        backgroundColor: kPrimaryColor,
        title: Center(
            child: Text(
          titles[initIndex],
          style: TextStyle(
            fontSize: 25,
          ),
        )),
        actions: [
          Row(
            children: [
              iconAdd(initIndex: initIndex, context: context),
              GestureDetector(
                onTap: () {
                  Authentication().signOut();
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage('assets/icons/person.png'),
                  ),
                ),
              ),
            ],
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
