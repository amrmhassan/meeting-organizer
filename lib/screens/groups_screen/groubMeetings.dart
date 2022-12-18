// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meeting_organizer/screens/groups_screen/widgets/checkboxTile.dart';
import '../../constants/colors.dart';

class groupScreen extends StatefulWidget {
  @override
  State<groupScreen> createState() => groupScreenState();
}
class groupScreenState extends State<groupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              color: Colors.white,
              Icons.arrow_back_ios,
            )),
        //? title of the group
        title: Text(
          'Group meeting',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Text(
                'Vote for the meeting time',
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => checkBoxTile(),
                separatorBuilder: (context, index) => SizedBox(
                      height: 20,
                    ),
                itemCount: 20),
          ),
          SizedBox(
            height: 5.0,
          ),
          Center(
            child: Container(
              height: 100,
              width: double.infinity,
              child: MaterialButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.add,
                        size: 22,
                        color: Color.fromARGB(255, 176, 177, 175),
                      ),
                      Text(
                        'Add another time',
                        style: TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 176, 177, 175),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
