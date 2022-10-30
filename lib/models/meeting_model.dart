import 'package:meeting_organizer/models/meeting_time_model.dart';
import 'package:meeting_organizer/models/user_model.dart';

class MeetingModel {
  late String meetingID;
  late String meetingName;
  late String groupID;
  late String creatorID;
  late String createdTime;
  late List<UserModel> attendees;
  late List<MeetingTimeModel> proposedTimes;
  String? topicDescription;
  // late List<DateTime> proposedTimes;

  MeetingModel({
    required this.meetingName,
    required this.meetingID,
    required this.groupID,
    required this.creatorID,
    required this.createdTime,
    required this.proposedTimes,
    required this.attendees,
    this.topicDescription,
  });

  MeetingModel.fromJson(Map<String, dynamic> json) {
    meetingID = json['meetingID'];
    meetingName = json['meetingName'];
    groupID = json['groupID'];
    creatorID = json['creatorID'];
    createdTime = json['createdTime'];
    proposedTimes = json['proposedTimes'];
    attendees = json['attendees'];
    topicDescription = json['topicDescription'];
  }
  Map<String, dynamic> toJson() {
    return {
      'meetingID': meetingID,
      'meetingName': meetingName,
      'groupID': groupID,
      'creatorID': creatorID,
      'createdTime': createdTime,
      'proposedTimes': proposedTimes,
      'attendees': attendees,
      'topicDescription': topicDescription,
    };
  }
}
