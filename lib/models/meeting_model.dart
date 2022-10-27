import 'package:meeting_organizer/models/meeting_time_model.dart';
import 'package:meeting_organizer/models/user_model.dart';

class MeetingModel {
  late String meetingID;
  late String groupID;
  late String creatorID;
  late String createdTime;
  late List<UserModel> attendees;
  late List<MeetingTimeModel> proposedTimes;
  // late List<DateTime> proposedTimes;

  MeetingModel({
    required this.meetingID,
    required this.groupID,
    required this.creatorID,
    required this.createdTime,
    required this.proposedTimes,
    required this.attendees,
  });

  MeetingModel.fromJson(Map<String, dynamic> json) {
    meetingID = json['meetingID'];
    groupID = json['groupID'];
    creatorID = json['creatorID'];
    createdTime = json['createdTime'];
    proposedTimes = json['proposedTimes'];
    attendees = json['attendees'];
  }
  Map<String, dynamic> toJson() {
    return {
      'meetingID': meetingID,
      'groupID': groupID,
      'creatorID': creatorID,
      'createdTime': createdTime,
      'proposedTimes': proposedTimes,
      'attendees': attendees,
    };
  }
}
