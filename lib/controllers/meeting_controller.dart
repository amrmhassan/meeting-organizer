import 'package:flutter/widgets.dart';
import 'package:meeting_organizer/models/meeting_model.dart';
import 'package:meeting_organizer/models/meeting_time_model.dart';
import 'package:meeting_organizer/models/user_model.dart';
import 'package:uuid/uuid.dart';

class MeetingsProvider with ChangeNotifier {
  List<MeetingModel> meetings = [];

  void getMeetings() {
    notifyListeners();
  }

  void addMeeting({
    required String meetingName,
    required String groupId,
    required String creatorId,
  }) {
    MeetingModel newMeeting = MeetingModel(
      meetingID: const Uuid().toString(),
      meetingName: meetingName,
      groupID: groupId,
      creatorID: creatorId,
      createdTime: DateTime.now().toString(),
      proposedTimes: [],
      attendees: [],
    );
    meetings.add(newMeeting);
    notifyListeners();
  }

  void deleteMeeting(String meetingID) {
    meetings.removeWhere((meeting) => meeting.meetingID == meetingID);
    notifyListeners();
  }

  MeetingModel? getMeetingById(String meetingID) {
    for (var meeting in meetings) {
      if (meeting.meetingID == meetingID) return meeting;
    }

    return null;
  }

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

  void removeProposeTime(String meetingID, DateTime proposedTime) {
    var selectedMeeting = getMeetingById(meetingID);
    selectedMeeting!.proposedTimes.removeWhere(
      (proposedTimeItem) => proposedTimeItem.proposedTime == proposedTime,
    );
    notifyListeners();
  }

  void addVote(String meetingID, DateTime proposedTime, UserModel voter) {
    var selectedMeeting = getMeetingById(meetingID);
    for (var time in selectedMeeting!.proposedTimes) {
      if (time.proposedTime == proposedTime && !time.voters.contains(voter)) {
        time.votes += voter.weight;
        time.voters.add(voter);
        notifyListeners();
      }
    }
  }

  void removeVote(String meetingID, DateTime proposedTime, UserModel voter) {
    var selectedMeeting = getMeetingById(meetingID);
    for (var time in selectedMeeting!.proposedTimes) {
      if (time.proposedTime == proposedTime && time.voters.contains(voter)) {
        time.votes -= voter.weight;
        time.voters.remove(voter);
        notifyListeners();
      }
    }
  }

  void addAttendee(String meetingID, UserModel attendee) {
    var selectedMeeting = getMeetingById(meetingID);
    if (!selectedMeeting!.attendees.contains(attendee)) {
      selectedMeeting.attendees.add(attendee);
      notifyListeners();
    }
  }

  void removeAttendee(String meetingID, UserModel attendee) {
    var selectedMeeting = getMeetingById(meetingID);
    if (selectedMeeting!.attendees.contains(attendee)) {
      selectedMeeting.attendees.remove(attendee);
      notifyListeners();
    }
  }
}