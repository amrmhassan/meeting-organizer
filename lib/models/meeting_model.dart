import 'package:meeting_organizer/models/meeting_time_model.dart';
import 'package:meeting_organizer/models/user_model.dart';

class MeetingModel {
  late String meetingID;
  late String meetingName;
  late String groupID;
  late String creatorID;
  late DateTime createdTime;
  List<UserModel> attendees = [];
  List<MeetingTimeModel> proposedTimes = [];
  String? topicDescription;
  String? creatorPhoto;
  String? creatorName;
  // late List<DateTime> proposedTimes;

  MeetingModel({
    required this.meetingName,
    required this.meetingID,
    required this.groupID,
    required this.creatorID,
    required this.createdTime,
    required this.proposedTimes,
    required this.attendees,
    required this.creatorPhoto,
    required this.creatorName,
    this.topicDescription,
  });

  MeetingModel.fromJson(Map<String, dynamic> json) {
    meetingID = json['meetingID'];
    meetingName = json['meetingName'];
    groupID = json['groupID'];
    creatorID = json['creatorID'];
    createdTime = json['createdTime'].toDate();
    json['proposedTimes']
        .forEach((time) => proposedTimes.add(MeetingTimeModel.fromJson(time)));
    json['attendees']
        .forEach((attendee) => attendees.add(UserModel.fromJson(attendee)));
    topicDescription = json['topicDescription'];
    creatorPhoto = json['creatorPhoto'];
    creatorName = json['creatorName'];
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
      'creatorPhoto': creatorPhoto,
      'creatorName': creatorName
    };
  }
}
