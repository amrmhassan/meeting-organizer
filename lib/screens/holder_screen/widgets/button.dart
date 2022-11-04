// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

Widget button({
  required BuildContext context,
  Color backgroundColor = Colors.black,
  String text = '',
  required VoidCallback onTap,
}) =>
    SizedBox(
      height: 55,
      width: 120,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              textStyle: TextStyle(fontSize: 20),
              backgroundColor: backgroundColor,
              //border width and color
              elevation: 3, //elevation of button

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)))),
          onPressed: onTap,
          child: Text(text),
        ),
      ),
    );
