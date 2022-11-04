import 'package:meeting_organizer/models/user_model.dart';

class MeetingTimeModel {
  late DateTime proposedTime;
  late int votes;
  late List<UserModel> voters;

  MeetingTimeModel({
    required this.proposedTime,
    required this.votes,
    required this.voters,
  });
  MeetingTimeModel.fromJson(Map<String, dynamic> json) {
    proposedTime = json['proposedTime'];
    votes = json['votes'];
    voters = json['voters'];
  }
  Map<String, dynamic> toJson() {
    return {
      'proposedTime': proposedTime,
      'votes': votes,
      'voters': voters,
    };
  }
}