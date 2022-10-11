import 'package:flutter/material.dart';
import 'package:meeting_organizer/constants/colors.dart';

class Background extends StatelessWidget {
  const Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
    );
  }
}
