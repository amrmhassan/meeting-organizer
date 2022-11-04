// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meeting_organizer/providers/meeting_provider.dart';
import 'package:provider/provider.dart';

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
          child: Text(text),
          onPressed: () {
            var provider =
                Provider.of<MeetingsProvider>(context, listen: false);
            provider.addMeeting(
                meetingName: 'meetingName',
                groupId: 'groupId',
                creatorId: 'creatorId');
            print(provider.meetings);
            Navigator.of(context).pop();
          },
        ),
      ),
    );
