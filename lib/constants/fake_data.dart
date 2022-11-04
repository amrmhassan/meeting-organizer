// ignore_for_file: prefer_const_constructors

import 'package:meeting_organizer/constants/golobal.dart';
import 'package:meeting_organizer/models/meeting_model.dart';
import 'package:meeting_organizer/models/meeting_time_model.dart';
import 'package:meeting_organizer/models/user_model.dart';
import 'package:uuid/uuid.dart';

List<MeetingModel> fake_meetings = [
  MeetingModel(
    meetingName: 'My first meeting name',
    meetingID: Uuid().v4(),
    groupID: Uuid().v4(),
    creatorID: 'creatorID',
    createdTime: DateTime.now().subtract(Duration(days: 6)),
    proposedTimes: [
      MeetingTimeModel(
        proposedTime: DateTime.now(),
        votes: 10,
        voters: [
          'user id 1',
        ],
      )
    ],
    attendees: [],
  ),
  MeetingModel(
    meetingName: 'My first meeting name',
    meetingID: Uuid().v4(),
    groupID: Uuid().v4(),
    creatorID: 'creatorID',
    createdTime: DateTime.now().subtract(Duration(days: 6)),
    proposedTimes: [
      MeetingTimeModel(
        proposedTime: DateTime.now(),
        votes: 10,
        voters: [
          'user id 2',
        ],
      )
    ],
    attendees: [],
  ),
];
