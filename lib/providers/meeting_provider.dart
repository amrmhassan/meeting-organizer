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
    _meetings = data.docs.map((e) {
      return MeetingModel.fromJson(e.data());
    }).toList();

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
    notifyListeners();
    await FirebaseFirestore.instance
        .collection(MEETINGS_COLLECTION)
        .doc(newMeeting.meetingID)
        .set(newMeeting.toJson())
        .then((value) => _meetings.add(newMeeting))
        .catchError((e) => e.toString());
  }

//? to delete a meeting
  void deleteMeeting(String meetingID) {
    FirebaseFirestore.instance
        .collection(MEETINGS_COLLECTION)
        .doc(meetingID)
        .delete()
        .then((value) =>
            _meetings.removeWhere((meeting) => meeting.meetingID == meetingID))
        .catchError((e) => e.toString());
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
    FirebaseFirestore.instance
        .collection(MEETINGS_COLLECTION)
        .doc(meetingID)
        .update({
      'proposedTimes': FieldValue.arrayUnion([newMeetingTime.toJson()])
    }).then((value) {
      notifyListeners();
      return selectedMeeting!.proposedTimes.add(newMeetingTime);
    }).catchError((e) => print(e.toString()));
  }

//? remove proposes time from meeting
  void removeProposeTime(String meetingID, DateTime proposedTime) {
    var selectedMeeting = getMeetingById(meetingID);
    MeetingTimeModel removedTime = selectedMeeting!.proposedTimes.firstWhere(
      (proposedTimeItem) => proposedTimeItem.proposedTime == proposedTime,
    );

    FirebaseFirestore.instance
        .collection(MEETINGS_COLLECTION)
        .doc(meetingID)
        .update({
      'proposedTimes': FieldValue.arrayRemove([removedTime.toJson()])
    }).then((value) {
      notifyListeners();
      return selectedMeeting.proposedTimes.remove(removedTime);
    }).catchError((e) => print(e.toString()));
  }

//? create a new vote for the meeting
  void addVote(String meetingID, DateTime proposedTime, UserModel voter) {
    var selectedMeeting = getMeetingById(meetingID);
    for (var time in selectedMeeting!.proposedTimes) {
      if (time.proposedTime == proposedTime &&
          !time.voters.contains(voter.userID)) {
        time.votes += voter.weight;
        time.voters.add(voter.userID);
        FirebaseFirestore.instance
            .collection(MEETINGS_COLLECTION)
            .doc(meetingID)
            .update({
              'proposedTimes': selectedMeeting.proposedTimes
                  .map(
                    (e) => e.toJson(),
                  )
                  .toList()
            })
            .then((value) => notifyListeners())
            .catchError((e) => print(e.toString()));
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
        FirebaseFirestore.instance
            .collection(MEETINGS_COLLECTION)
            .doc(meetingID)
            .update({
              'proposedTimes': selectedMeeting.proposedTimes
                  .map(
                    (e) => e.toJson(),
                  )
                  .toList()
            })
            .then((value) => notifyListeners())
            .catchError((e) => print(e.toString()));
      }
    }
  }

  void addAttendee(String meetingID, UserModel attendee) {
    var selectedMeeting = getMeetingById(meetingID);
    bool isFound = selectedMeeting!.attendees
        .any((element) => element.userID == attendee.userID);
    if (!isFound) {
      attendee.weight++;
      selectedMeeting.attendees.add(attendee);
      FirebaseFirestore.instance
          .collection(MEETINGS_COLLECTION)
          .doc(meetingID)
          .update({
            'attendees': selectedMeeting.attendees
                .map(
                  (e) => e.toJson(),
                )
                .toList()
          })
          .then((value) => notifyListeners())
          .catchError((e) => print(e.toString()));
    }
  }

  void removeAttendee(String meetingID, UserModel attendee) {
    var selectedMeeting = getMeetingById(meetingID);
    bool isFound = selectedMeeting!.attendees
        .any((element) => element.userID == attendee.userID);
    if (isFound) {
      attendee.weight--;
      selectedMeeting.attendees
          .removeWhere((element) => element.userID == attendee.userID);
      FirebaseFirestore.instance
          .collection(MEETINGS_COLLECTION)
          .doc(meetingID)
          .update({
            'attendees': selectedMeeting.attendees
                .map(
                  (e) => e.toJson(),
                )
                .toList()
          })
          .then((value) => notifyListeners())
          .catchError((e) => print(e.toString()));
    }
  }
}
