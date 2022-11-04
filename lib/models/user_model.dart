class UserModel {
  late String userID;
  late String userGID; //from google
  late int weight;
  late String userName;
  late String userImage;
  UserModel({
    required this.userID,
    required this.userGID,
    required this.weight,
    required this.userImage,
    required this.userName,
  });
  UserModel.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    userGID = json['userGID'];
    weight = json['weight'];
    userName = json['userName'];
    userImage = json['userImage'];
  }
  Map<String, dynamic> toJson() {
    return {
      'userID': userID,
      'userGID': userGID,
      'weight': weight,
      'userName': userName,
      'userImage': userImage,
    };
  }
}
