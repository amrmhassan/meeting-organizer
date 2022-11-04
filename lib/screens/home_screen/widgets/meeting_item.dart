// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meeting_organizer/models/meeting_model.dart';
import 'package:meeting_organizer/models/meeting_time_model.dart';
import 'package:meeting_organizer/screens/votes_screen/votes_screen.dart';

class MeetingItem extends StatelessWidget {
  final MeetingModel meetingModel;
  MeetingItem({
    super.key,
    required this.meetingModel,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (builder) {
          return VotesScreen(
            meetingModel: meetingModel,
          );
        }));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 22.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              15.0,
            ),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(22, 12, 22, 12),
                  child: Text(
                    meetingModel.meetingName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Color(0xff7C80FF),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 0, 20, 0),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage('assets/icons/person.png'),
                        ),
                      ),
                      Text(
                        meetingModel.creatorID,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
