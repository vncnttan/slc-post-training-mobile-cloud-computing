class UserModel {
  int id;
  String email;
  String password;
  String token;

  UserModel(
      {required this.id,
      required this.email,
      required this.password,
      required this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json["id"] as int,
        email: json["email"] as String,
        password: json["password"] as String,
        token: json["token"] as String);
  }
}
