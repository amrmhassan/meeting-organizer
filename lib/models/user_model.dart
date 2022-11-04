class UserModel {
  late String userID;
  late String userGID; //from google
  late int weight;
  UserModel({
    required this.userID,
    required this.userGID,
    required this.weight,
  });
  UserModel.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    userGID = json['userGID'];
    weight = json['weight'];
  }
  Map<String, dynamic> toJson() {
    return {
      'userID': userID,
      'userGID': userGID,
      'weight': weight,
    };
  }
}
