// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:meeting_organizer/models/group_model.dart';
import 'package:meeting_organizer/screens/groups_screen/groubMeetings.dart';
import 'package:meeting_organizer/screens/groups_screen/widgets/card.dart';
import 'package:meeting_organizer/screens/groups_screen/widgets/separator.dart';

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
            return DefaultCardView(
              onTap:()
              {
                Navigator.push(context, MaterialPageRoute(
                      builder: (context) => groupScreen(),
                  ));
               },
              groupIcon: Icons.group,
              groupName: groups[index].groupName,
              members: groups[index].members.toString(),
            );
          },
          separatorBuilder: (context, index)
          => ItemSeparator(),
          itemCount: groups.length),
    );
  }
}
