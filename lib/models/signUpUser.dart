
class User {
  final String firstname;
  final String lastname;
  final String email;
  final String phone;
  final String password;
  final String state;
  final String country;
  final String address;
  final String type; // This type means type of user either vendor or consumer

  User(
      {this.firstname,
      this.lastname,
      this.email,
      this.country,
      this.address,
      this.password,
      this.phone,
      this.state,
      this.type});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstname: json["firstname"],
      lastname: json["lastname"],
      phone: json["phone"],
      email: json["email"],
      password: json["password"],
      state: json["state"],
      country: json["country"],
      address: json["address"],
      type: json["type"],
    );
  }

  Map<String, dynamic> toJson() 
  {
    return {
        "firstname": firstname,
        "lastname": lastname,
        "phone": phone,
        "email": email,
        "password": password,
        "state": state,
        "country": country,
        "address": address,
        "type": type,
      };
  }
}

class ActivateUser {

  final String token;

  ActivateUser({this.token});

  Map<String, dynamic> toJson(){

    return {
    "token":token,
    };
  }

}
