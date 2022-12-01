// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meeting_organizer/models/meeting_model.dart';
import 'package:meeting_organizer/models/meeting_time_model.dart';
import 'package:meeting_organizer/providers/meeting_provider.dart';
import 'package:meeting_organizer/screens/votes_screen/votes_screen.dart';
import 'package:provider/provider.dart';

class MeetingItem extends StatelessWidget {
  final MeetingModel meetingModel;
  MeetingItem({
    super.key,
    required this.meetingModel,
  });
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MeetingsProvider>(context, listen: false);
    return GestureDetector(
      onLongPress: () => provider.deleteMeeting(meetingModel.meetingID),
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
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
                            child: meetingModel.creatorPhoto == null
                                ? CircleAvatar(
                                    radius: 18,
                                    backgroundImage:
                                        AssetImage('assets/icons/person.png'),
                                  )
                                : CircleAvatar(
                                    radius: 18,
                                    backgroundImage:
                                        NetworkImage(meetingModel.creatorPhoto!),
                                  ),
                          ),
                          Expanded(
                            child: Text(
                              meetingModel.creatorName.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
