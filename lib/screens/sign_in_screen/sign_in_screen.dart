// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:meeting_organizer/screens/sign_in_screen/widgets/background.dart';
import 'package:meeting_organizer/screens/sign_in_screen/widgets/front_images.dart';
import 'package:meeting_organizer/screens/sign_in_screen/widgets/google_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Background(),
          FrontImages(),
          GoogleButton(),
        ],
      ),
    );
  }
}
