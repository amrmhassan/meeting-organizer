class MeetingTimeModel {
  late DateTime proposedDate;
  late String proposedTime;
  late int votes;
  List<String> voters = [];

  MeetingTimeModel({
    required this.proposedDate,
    required this.proposedTime,
    required this.votes,
    required this.voters,
  });
  MeetingTimeModel.fromJson(Map<String, dynamic> json) {
    proposedDate = json['proposedDate'].toDate();
    proposedTime = json['proposedTime'];
    votes = json['votes'];
    json['voters'].forEach((voter) => voters.add(voter));
  }
  Map<String, dynamic> toJson() {
    return {
      'proposedDate': proposedDate,
      'proposedTime': proposedTime,
      'votes': votes,
      'voters': voters,
    };
  }
}
