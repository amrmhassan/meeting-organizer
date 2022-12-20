// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meeting_organizer/constants/colors.dart';
import 'package:meeting_organizer/models/meeting_model.dart';
import 'package:meeting_organizer/models/meeting_time_model.dart';
import 'package:provider/provider.dart';

import '../../providers/meeting_provider.dart';
import '../holder_screen/widgets/button.dart';

class VotesScreen extends StatefulWidget {
  final MeetingModel meetingModel;
  const VotesScreen({
    super.key,
    required this.meetingModel,
  });

  @override
  State<VotesScreen> createState() => _VotestState();
}

class _VotestState extends State<VotesScreen> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    final MeetingModel meeting = widget.meetingModel;
    List<MeetingTimeModel> allTimes = meeting.proposedTimes;
    DateTime? meetingDate;
    TimeOfDay? meetingTime;
    void setMeetingDate(DateTime? d) {
      setState(() {
        meetingDate = d;
      });
    }

    void setMeetingTime(TimeOfDay? t) {
      setState(() {
        meetingTime = t;
      });
    }

    void addNewMeeting() {
      if (meetingDate != null && meetingTime != null) {
        Provider.of<MeetingsProvider>(context, listen: false)
            .addProposeTime(meeting.meetingID, meetingDate!, meetingTime!);
        setState(() {
          meetingDate = null;
          meetingTime = null;
        });

        Navigator.pop(context);
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Center(
          child: Text(
            meeting.meetingName,
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
      body: Column(
        children: [
          if (allTimes.isEmpty) const Spacer(),
          allTimes.isEmpty
              ? Text(
                  'This meeting has no time yet',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )
              : Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'Vote for the meeting time ',
                          style: TextStyle(
                            fontSize: 28,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Consumer<MeetingsProvider>(
                          builder: (context, value, child) =>
                              ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) => listItem(
                                allTimes[index], context, meeting.meetingID),
                            separatorBuilder: (context, index) => SizedBox(
                              height: 5.0,
                            ),
                            itemCount: allTimes.length,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                    ],
                  ),
                ),
          if (allTimes.isEmpty) const Spacer(),
          SizedBox(
            height: 80,
            width: double.infinity,
            child: MaterialButton(
                onPressed: () {
                  timeAdd(
                    context: context,
                    meetingDate: meetingDate,
                    meetingTime: meetingTime,
                    setMeetingDate: setMeetingDate,
                    setMeetingTime: setMeetingTime,
                    addNewMeeting: addNewMeeting,
                  );
                },
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
          )
        ],
      ),
    );
  }

  Widget listItem(MeetingTimeModel proposedDate, context, meetingID) {
    var provider = Provider.of<MeetingsProvider>(context, listen: false);
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white30,
              ),
              child: ListTile(
                title: Text(
                    '${DateFormat.MMMd().format(proposedDate.proposedDate)} ${proposedDate.proposedTime}'),
                leading: const Icon(Icons.access_time),
                subtitle: Text('${proposedDate.votes} Votes on this time'),
                trailing: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    provider.addVote(
                      meetingID,
                      proposedDate.proposedDate,
                      provider.createUserModel(),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void timeAdd({
    required BuildContext context,
    required DateTime? meetingDate,
    required TimeOfDay? meetingTime,
    required Function(DateTime? t) setMeetingDate,
    required Function(TimeOfDay? t) setMeetingTime,
    required VoidCallback addNewMeeting,
  }) =>
      showDialog(
        builder: (context) {
          DateTime? mDate = meetingDate;
          TimeOfDay? mTime = meetingTime;
          return StatefulBuilder(builder: (context, setState) {
            return Center(
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
                                  setState(
                                    () {
                                      mDate = pickedDate;
                                    },
                                  );
                                  setMeetingDate(pickedDate);
                                },
                                child: mDate == null
                                    ? Column(
                                        children: const [
                                          Text('Meeting Date',
                                              style: TextStyle(fontSize: 16)),
                                          Icon(
                                            Icons.calendar_month_outlined,
                                            size: 80,
                                          ),
                                        ],
                                      )
                                    : Text(DateFormat.MMMd().format(mDate!)),
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
                                setState(
                                  () {
                                    mTime = time;
                                  },
                                );
                              },
                              child: mTime == null
                                  ? Column(
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
                                    )
                                  : Text(DateFormat.Hm().format(DateTime(
                                      DateTime.now().year,
                                      DateTime.now().month,
                                      DateTime.now().day,
                                      mTime!.hour,
                                      mTime!.minute,
                                    ))),
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
                            onTap: addNewMeeting,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          });
        },
        context: context,
        barrierDismissible: false,
      );
}
