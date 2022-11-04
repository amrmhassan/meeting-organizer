// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:meeting_organizer/constants/colors.dart';
import 'package:meeting_organizer/screens/holder_screen/widgets/button.dart';

Widget iconAdd({
  int initIndex = 1,
  required BuildContext context,
  required DateTime? meetingDate,
  required TimeOfDay? meetingTime,
  required Function(DateTime? t) setMeetingDate,
  required Function(TimeOfDay? t) setMeetingTime,
  required TextEditingController meetingName,
  required VoidCallback addNewMeeting,
}) =>
    initIndex == 1
        ? IconButton(
            onPressed: () => dialog(
              context: context,
              meetingDate: meetingDate,
              meetingTime: meetingTime,
              setMeetingDate: setMeetingDate,
              setMeetingTime: setMeetingTime,
              meetingName: meetingName,
              addNewMeeting: addNewMeeting,
            ),
            icon: Icon(
              Icons.add,
              size: 35,
            ),
          )
        : Container();

void dialog({
  required BuildContext context,
  required DateTime? meetingDate,
  required TimeOfDay? meetingTime,
  required Function(DateTime? t) setMeetingDate,
  required Function(TimeOfDay? t) setMeetingTime,
  required TextEditingController meetingName,
  required VoidCallback addNewMeeting,
}) =>
    showDialog(
      builder: (context) => SingleChildScrollView(
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 12),
              const Text(
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
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Meeting Title',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    TextField(
                      controller: meetingName,
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
                          onPressed: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(
                                Duration(days: 60),
                              ),
                            );
                            setMeetingDate(pickedDate);
                          },
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
                        onPressed: () async {
                          TimeOfDay? time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          setMeetingTime(time);
                        },
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
                        onTap: () {
                          Navigator.pop(context);
                        }),
                    button(
                      context: context,
                      backgroundColor: kPrimaryColor,
                      text: 'create',
                      onTap: () {
                        addNewMeeting();
                        Navigator.pop(context);
                      },
                    )
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
