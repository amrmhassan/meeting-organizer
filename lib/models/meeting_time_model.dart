class MeetingTimeModel {
  late DateTime proposedTime;
  late int votes;
  List<String> voters = [];

  MeetingTimeModel({
    required this.proposedTime,
    required this.votes,
    required this.voters,
  });
  MeetingTimeModel.fromJson(Map<String, dynamic> json) {
    proposedTime = json['proposedTime'].toDate();
    votes = json['votes'];
    json['voters'].forEach((voter) => voters.add(voter));
  }
  Map<String, dynamic> toJson() {
    return {
      'proposedTime': proposedTime,
      'votes': votes,
      'voters': voters,
    };
  }
}
