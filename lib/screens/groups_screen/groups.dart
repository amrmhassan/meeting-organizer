// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:meeting_organizer/screens/groups_screen/groub_meetings.dart';
import 'package:meeting_organizer/screens/groups_screen/widgets/card.dart';
import 'package:meeting_organizer/screens/groups_screen/widgets/dialog.dart';
import '../../constants/colors.dart';
import 'models/groub_model.dart';
class GroupsScreen extends StatelessWidget {
   late groub_model groub;
  List <groub_model> groubs = [
    groub_model( icon: Icons.group, groub_name: 'group 1'),
    groub_model( icon: Icons.group, groub_name: 'group 2'),
    groub_model( icon: Icons.group, groub_name: 'group 3'),
    groub_model( icon: Icons.group, groub_name: 'group 4'),
    groub_model( icon: Icons.group, groub_name: 'group 5'),
    groub_model( icon: Icons.group, groub_name: 'group 6'),
    groub_model( icon: Icons.group, groub_name: 'group 7'),
    groub_model( icon: Icons.group, groub_name: 'group 8'),
    groub_model( icon: Icons.group, groub_name: 'group 9'),
    groub_model( icon: Icons.group, groub_name: 'group 10'),
    groub_model( icon: Icons.group, groub_name: 'group 11'),
    groub_model( icon: Icons.group, groub_name: 'grouP 12'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context,index) {
            return defaultCard (
                groubs[index], ontap: ()
            {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>meetings()));
            },
            );
          },
          separatorBuilder: (context,index)=>SizedBox(height: 0.1,),
          itemCount: groubs.length),
    );
  }
}


