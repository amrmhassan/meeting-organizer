import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:meeting_organizer/constants/golobal.dart';
import 'package:meeting_organizer/models/meeting_model.dart';
import 'package:meeting_organizer/models/meeting_time_model.dart';
import 'package:meeting_organizer/models/user_model.dart';
import 'package:uuid/uuid.dart';

class MeetingsProvider with ChangeNotifier {
  List<MeetingModel> _meetings = [];

  List<MeetingModel> get meetings {
    return [..._meetings];
  }

//? load fake data
  void loadFakeMeetings(List<MeetingModel> m) {
    _meetings = m;
    notifyListeners();
  }

  Future<void> getMeetings() async {
    await FirebaseFirestore.instance
        .collection(MEETINGS_COLLECTION)
        .get()
        .then((value) => value.docs.forEach((meeting) {
              _meetings.add(MeetingModel.fromJson(meeting.data()));
            }))
        .catchError((error) {
      print(error.toString());
    });
    notifyListeners();
  }

//? to add a new meeting
  addMeeting({
    required String meetingName,
    required String groupId,
    required String creatorId,
  }) {
    MeetingModel newMeeting = MeetingModel(
      meetingID: const Uuid().v4(),
      meetingName: meetingName,
      groupID: groupId,
      creatorID: creatorId,
      createdTime: DateTime.now(),
      proposedTimes: [],
      attendees: [],
    );
    FirebaseFirestore.instance
        .collection(MEETINGS_COLLECTION)
        .doc(newMeeting.meetingID)
        .set(newMeeting.toJson())
        .then((value) async {
      _meetings = [];
      getMeetings();
    }).catchError((error) {
      print(error.toString());
    });
    notifyListeners();
  }

//? to delete a meeting
  void deleteMeeting(String meetingID) {
    _meetings.removeWhere((meeting) => meeting.meetingID == meetingID);
    notifyListeners();
  }

//? get meeting by id
  MeetingModel? getMeetingById(String meetingID) {
    for (var meeting in _meetings) {
      if (meeting.meetingID == meetingID) return meeting;
    }

    return null;
  }

//? add proposed time for meeting
  void addProposeTime(String meetingID, DateTime proposedTime) {
    var selectedMeeting = getMeetingById(meetingID);
    MeetingTimeModel newMeetingTime = MeetingTimeModel(
      proposedTime: proposedTime,
      voters: [],
      votes: 0,
    );
    selectedMeeting!.proposedTimes.add(newMeetingTime);
    notifyListeners();
  }

//? remove proposes time from meeting
  void removeProposeTime(String meetingID, DateTime proposedTime) {
    var selectedMeeting = getMeetingById(meetingID);
    selectedMeeting!.proposedTimes.removeWhere(
      (proposedTimeItem) => proposedTimeItem.proposedTime == proposedTime,
    );
    notifyListeners();
  }

//? create a new vote for the meeting
  void addVote(String meetingID, DateTime proposedTime, UserModel voter) {
    var selectedMeeting = getMeetingById(meetingID);
    for (var time in selectedMeeting!.proposedTimes) {
      if (time.proposedTime == proposedTime &&
          !time.voters.contains(voter.userID)) {
        time.votes += voter.weight;
        time.voters.add(voter.userID);
        notifyListeners();
      }
    }
  }

  void removeVote(String meetingID, DateTime proposedTime, UserModel voter) {
    var selectedMeeting = getMeetingById(meetingID);
    for (var time in selectedMeeting!.proposedTimes) {
      if (time.proposedTime == proposedTime &&
          time.voters.contains(voter.userID)) {
        time.votes -= voter.weight;
        time.voters.remove(voter.userID);
        notifyListeners();
      }
    }
  }

  void addAttendee(String meetingID, UserModel attendee) {
    var selectedMeeting = getMeetingById(meetingID);
    if (!selectedMeeting!.attendees.contains(attendee.userID)) {
      selectedMeeting.attendees.add(attendee.userID);
      notifyListeners();
    }
  }

  void removeAttendee(String meetingID, UserModel attendee) {
    var selectedMeeting = getMeetingById(meetingID);
    if (selectedMeeting!.attendees.contains(attendee.userID)) {
      selectedMeeting.attendees.remove(attendee.userID);
      notifyListeners();
    }
  }
}
