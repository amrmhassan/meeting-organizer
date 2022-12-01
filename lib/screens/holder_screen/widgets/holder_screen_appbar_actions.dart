// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meeting_organizer/constants/golobal.dart';
import 'package:meeting_organizer/helper/authentication.dart';
import 'package:meeting_organizer/providers/meeting_provider.dart';
import 'package:meeting_organizer/screens/holder_screen/widgets/groubAdd_Icon.dart';
import 'package:meeting_organizer/screens/holder_screen/widgets/iconAdd.dart';
import 'package:provider/provider.dart';

class HolderScreenAppBarAction extends StatefulWidget {
  const HolderScreenAppBarAction({
    Key? key,
    required this.initIndex,
  }) : super(key: key);

  final int initIndex;

  @override
  State<HolderScreenAppBarAction> createState() =>
      _HolderScreenAppBarActionState();
}

class _HolderScreenAppBarActionState extends State<HolderScreenAppBarAction> {
  TextEditingController meetingName = TextEditingController();
  DateTime? meetingDate;
  TimeOfDay? meetingTime;

  void setMeetingDate(DateTime? d) {
    setState(() {
      meetingDate = d;
    });
  }

  void setMeetingTime(TimeOfDay? t) {
    setState(() {
      meetingTime = t;
    });
  }

  void addNewMeeting() {
    if (meetingDate != null &&
        meetingTime != null &&
        meetingName.text.isNotEmpty) {
      //? add the new meeting code here
      Provider.of<MeetingsProvider>(context, listen: false).addMeeting(
        meetingName: meetingName.text,
        groupId: 'groupId',
      );
      setState(() {
        meetingDate = null;
        meetingTime = null;
        meetingName.text = '';
      });

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;
    return Row(
      children: [
        defaultIcon_buttom(
          initIndex: widget.initIndex,
            context: context
        ),
        iconAdd(
          initIndex: widget.initIndex,
          context: context,
          meetingDate: meetingDate,
          meetingTime: meetingTime,
          setMeetingDate: setMeetingDate,
          setMeetingTime: setMeetingTime,
          meetingName: meetingName,
          addNewMeeting: addNewMeeting,
        ),
        GestureDetector(
          onTap: () {
            Authentication().signOut();
          },
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: currentUser?.photoURL == null
                ? CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage('assets/icons/person.png'),
                  )
                : CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage(currentUser!.photoURL!),
                  ),
          ),
        ),
      ],
    );
  }
}
