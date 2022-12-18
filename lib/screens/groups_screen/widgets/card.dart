// ignore_for_file: unnecessary_string_interpolations
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meeting_organizer/models/group_model.dart';
import '../../../constants/colors.dart';
   // reusable components for  card widget
   // display group name
    Widget DefaultCard(
        GroupModel group, {
          required Function ontap,
        }) =>
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: InkWell(
            onTap: () {
              ontap();
            },
            child: Card(
              elevation: 0.0,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: kPrimaryColor,
                      radius: 20,
                      child: Icon(
                        Icons.group,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${group.creatorID}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );