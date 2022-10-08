// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meeting_organizer/constants/sizes.dart';
import 'package:meeting_organizer/helper/responsive.dart';

class Clouds extends StatelessWidget {
  const Clouds({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -20,
      right: 0,
      child: Column(
        children: [
          Text(
            'You need to sign in with Google to continue',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: kVPad * 1.5,
          ),
          Image.asset(
            'assets/icons/clouds.png',
            width: Responsive.getWidth(context),
          ),
        ],
      ),
    );
  }
}
