import 'package:flutter/material.dart';
import 'package:meeting_organizer/constants/colors.dart';
import 'package:meeting_organizer/screens/holder_screen/component/button.dart';

Widget iconAdd({int initIndex = 1, required BuildContext context}) =>
    initIndex == 1
        ? IconButton(
            onPressed: () => dialog(context),
            icon: Icon(
              Icons.add,
              size: 35,
            ),
          )
        : Container();

void dialog(BuildContext context) => showDialog(
      builder: (context) => SingleChildScrollView(
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 12),
              Text(
                'Create New Meeting',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: kPrimaryColor,
                ),
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Meeting Title',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter title for the meeting',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        child: MaterialButton(
                          onPressed: () {},
                          child: Column(
                            children: const [
                              Text('Meeting Date',
                                  style: TextStyle(fontSize: 16)),
                              Icon(
                                Icons.calendar_month_outlined,
                                size: 80,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {},
                        child: Column(
                          children: const [
                            Text(
                              'Meeting Time',
                              style: TextStyle(fontSize: 16),
                            ),
                            Icon(
                              Icons.access_time,
                              size: 90,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    button(
                      context: context,
                      backgroundColor: Colors.black,
                      text: 'Cancel',
                    ),
                    button(
                        context: context,
                        backgroundColor: kPrimaryColor,
                        text: 'create')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      context: context,
      barrierDismissible: false,
    );
