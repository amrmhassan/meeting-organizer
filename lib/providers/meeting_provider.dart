import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    var data =
        await FirebaseFirestore.instance.collection(MEETINGS_COLLECTION).get();
    _meetings = data.docs.map((e) => MeetingModel.fromJson(e.data())).toList();

    notifyListeners();
  }

//? to add a new meeting
  addMeeting({
    required String meetingName,
    required String groupId,
  }) async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    MeetingModel newMeeting = MeetingModel(
      meetingID: const Uuid().v4(),
      meetingName: meetingName,
      groupID: groupId,
      creatorID: currentUser!.uid,
      createdTime: DateTime.now(),
      proposedTimes: [],
      attendees: [],
      creatorPhoto: currentUser.photoURL,
      creatorName: currentUser.displayName.toString(),
    );
    _meetings.add(newMeeting);
    notifyListeners();
    await FirebaseFirestore.instance
        .collection(MEETINGS_COLLECTION)
        .doc(newMeeting.meetingID)
        .set(newMeeting.toJson());
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
