class LoginUser {
  final String username;
  final String password;

  LoginUser({this.username, this.password});

  Map<String, dynamic> toJson() {
    return {
      "username" : username,
      "password" : password,
    };
  }
}