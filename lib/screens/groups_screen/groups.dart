// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:meeting_organizer/models/group_model.dart';
import 'package:meeting_organizer/screens/groups_screen/groub_meetings.dart';
import 'package:meeting_organizer/screens/groups_screen/widgets/card.dart';

List<GroupModel> groups = [
  GroupModel(
      groupID: 'groupID',
      creatorID: 'creatorID',
      members: [],
      groupName: 'SPE Group'),
];

class GroupsScreen extends StatelessWidget {
  const GroupsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context, index) {
            return defaultCard(
              groups[index],
              ontap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GroupScreen()));
              },
            );
          },
          separatorBuilder: (context, index) => SizedBox(
                height: 0.1,
              ),
          itemCount: groups.length),
    );
  }
}
