import 'package:flutter/cupertino.dart';
import 'package:meeting_organizer/models/group_model.dart';

class GroupsProvider extends ChangeNotifier {
  final List<GroupModel> _groups = [];
  List<GroupModel> get groups => [..._groups];

  //? adding a new group

}
