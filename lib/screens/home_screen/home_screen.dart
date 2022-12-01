// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:meeting_organizer/providers/meeting_provider.dart';
import 'package:meeting_organizer/screens/home_screen/widgets/meeting_item.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var meetingProvider = Provider.of<MeetingsProvider>(context);
    return Scaffold(
      body: meetingProvider.loadingMeetings
          ? Center(
              child: CircularProgressIndicator(strokeWidth: 4),
            )
          : meetingProvider.meetings.isEmpty
              ? Center(
                  child: Text(
                    'You have no meetings to vote',
                  ),
                )
              : Column(
                  children: [
                    SizedBox(height: 20),
                    if (meetingProvider.uploadingMeeting)
                      CreatingMeetingLoader(),
                    Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => MeetingItem(
                          meetingModel: meetingProvider.meetings[index],
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

class CreatingMeetingLoader extends StatelessWidget {
  const CreatingMeetingLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        child: Column(
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text('Creating Meetings'),
          ],
        ),
      ),
    );
  }
}
