import 'package:meeting_organizer/models/user_model.dart';

class GroupModel {
  late String groupID;
  late String creatorID;
  late List<UserModel> members;

  GroupModel({
    required this.groupID,
    required this.creatorID,
    required this.members,
  });
  GroupModel.fromJson(Map<String, dynamic> json) {
    groupID = json['groupID'];
    creatorID = json['creatorID'];
    members = json['members'];
  }
  Map<String, dynamic> toJson() {
    return {
      'groupID': groupID,
      'creatorID': creatorID,
      'members': members,
    };
  }
}
