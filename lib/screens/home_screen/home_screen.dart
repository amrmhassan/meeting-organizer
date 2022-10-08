// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:meeting_organizer/constants/sizes.dart';
import 'package:meeting_organizer/screens/home_screen/widgets/background.dart';
import 'package:meeting_organizer/screens/home_screen/widgets/google_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: Color(0xff7C80FF),
          ),
          Clouds(),
          GoogleButton(),
        ],
      ),
    );
  }
}
