import 'package:meeting_organizer/models/user_model.dart';

class GroupModel {
  late String groupID;
  late String creatorID;
  late List<UserModel> members;
  late String groupName;

  GroupModel({
    required this.groupID,
    required this.creatorID,
    required this.members,
    required this.groupName,
  });
  GroupModel.fromJson(Map<String, dynamic> json) {
    groupID = json['groupID'];
    creatorID = json['creatorID'];
    members = json['members'];
    groupName = json['groupName'];
  }
  Map<String, dynamic> toJson() {
    return {
      'groupID': groupID,
      'creatorID': creatorID,
      'members': members,
      'groupName': groupName,
    };
  }
}
