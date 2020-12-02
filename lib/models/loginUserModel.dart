import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginUserModel with ChangeNotifier {
  String _email;
  String _password;
  String _address;

  LoginUserModel() {
    loadLoginPrefs();
  }

  // Custome Getters
  String get username => _email;
  String get password => _password;
  String get address => _address;

  // Custome Setters

  setUserData(String email, String password, String address) async {
    _email = email;
    _password = password;
    _address = address;
    await saveLoginPrefs();
    notifyListeners();
  }

  // void setUsername(String username) {
  //   _username = username;
  //   saveLoginPrefs();
  //   notifyListeners();
  // }

  // void setPassword(String password) {
  //   _password = password;
  //   saveLoginPrefs();
  //   notifyListeners();
  // }

  // void setAddress(String address) {
  //   _address = address;
  //   saveLoginPrefs();
  //   notifyListeners();
  // }

  saveLoginPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", _email);
    prefs.setString("password", _password);
    prefs.setString("address", _address);
  }

  Future<bool> loadLoginPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString("email");
    String password = prefs.getString("password");
    String address = prefs.getString('address');

    // only loade sharedPrefs if there is a stored data;
    if (email != null && password != null && address != null) {
      setUserData(email, password, address);
      return true;
    }

    return false;

    // if (username != null) setUsername(username);
    // if (password != null) setUsername(password);
  }

  Future<bool> auth({String passWord, String eMail}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString("email");
    String password = prefs.getString("password");
    String address = prefs.getString('address');
    bool isAuth = false;

    if (email != null && password != null && address != null) {
      if (passWord == password && eMail == email) {
        return isAuth = true;
      }
    } else {
      isAuth = false;
    }

    return isAuth;
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     "username": username,
  //     "password": password,
  //   };
  // }
}
