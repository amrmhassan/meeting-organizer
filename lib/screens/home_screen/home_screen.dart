// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meeting_organizer/providers/meeting_provider.dart';
import 'package:meeting_organizer/screens/home_screen/widgets/meeting_item.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var meetingProvider = Provider.of<MeetingsProvider>(context);
    var reversedMeetings = meetingProvider.meetings.reversed.toList();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => MeetingItem(
                meetingModel: reversedMeetings[index],
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: 16.0,
              ),
              itemCount: meetingProvider.meetings.length,
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
        ],
      ),
    );
  }
}
