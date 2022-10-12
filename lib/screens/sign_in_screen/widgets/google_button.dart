// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meeting_organizer/constants/sizes.dart';
import 'package:meeting_organizer/global/widgets/button_wrapper.dart';
import 'package:meeting_organizer/helper/authentication.dart';
import 'package:meeting_organizer/screens/holder_screen/holder_screen.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40,
      child: ButtonWrapper(
        onTap: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) {
          //   return HolderScreen();
          // }));
          Authentication().signInWithGoogle();
        },
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(500),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 15,
              color: Colors.grey.withOpacity(.8),
            )
          ],
        ),
        padding: EdgeInsets.all(ultraLargePadding),
        width: 100,
        height: 100,
        child: Image.asset('assets/icons/search.png'),
      ),
    );
  }
}
