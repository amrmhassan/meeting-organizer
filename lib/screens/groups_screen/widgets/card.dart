// ignore_for_file: unnecessary_string_interpolations
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
   // reusable components for  card widget
   // display group name
class DefaultCardView extends StatelessWidget {
   DefaultCardView({
     Key? key,
     required this.onTap,
     this.groupIcon,
     this.groupName,
     this.members,
   });
 final Function onTap ;
 IconData? groupIcon;
 String? groupName;
 String? members;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){onTap();},
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            color: Colors.grey[300],
            elevation: 0.0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    backgroundColor: kPrimaryColor,
                    radius: 25,
                    child: Icon(
                      groupIcon,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$groupName',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        'Members: $members',
                         style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                         overflow: TextOverflow.ellipsis,
                         maxLines: 1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


