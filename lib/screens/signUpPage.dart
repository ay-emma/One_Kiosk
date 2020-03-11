import 'package:flutter/material.dart';
import 'package:one_kiosk/models/testinghttp.dart';
import 'package:one_kiosk/screens/login.dart';
import 'package:one_kiosk/screens/passwordValidation.dart';
import 'package:one_kiosk/screens/storehome.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:one_kiosk/screens/verifyAccout.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  double topOne = 0;
  double topTwo = 110;

  final _formKey = GlobalKey<FormState>();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  String _lastname = "";
  String _firstname = "";
  String _email = "";
  String _stdPhoneNo;
  String _phoneNo = "";
  String _password = "";
  String _confirmPassword = "";
  bool _showPassword = true;
  bool _showConfirmPassword = true;

  var _countryCode = ["+234", "+112", "+232"];
  var _currentItemSelected = "+234";

  var _countryList = [
    "Ascension Island",
    'Benin',
    "Burkina Faso",
    "Cape Verde",
    'Ivory Coast',
    "Gambia",
    'Ghana',
    "Guinea",
    "Guinea-Bissau",
    "Liberia",
    "Mali",
    "Mauritania",
    "Niger",
    "Nigeria",
    "Saint Helena",
    "Senegal",
    "Sierra Leone",
    "Togo",
    'Tristan da Cunha',
  ];
  var _currentCountrySelected = "Nigeria";

  var _stateList = [
    "oyo",
    "kaduna",
    "Niger",
    "Osun",
    "lagos",
  ];

  var _currentStateSelected = "Osun";

  void performSignUp() {
    setState(() {
      _stdPhoneNo = _currentItemSelected + _phoneNo.substring(1, 11);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    });
    //sendData();
  }

  void sendgfData() {
    print(_firstname);
    print(_lastname);
    print(_email);

    print(_stdPhoneNo);
    print(_password);
    print("new");
    print(_currentCountrySelected);
    print(_currentStateSelected);
    // User signinUp_A_User = User();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NotificationListener(
        onNotification:  (ayo) {
          if (ayo is ScrollUpdateNotification) {
            setState(() {
              topOne = topOne - ayo.scrollDelta / 3;
              topTwo = topTwo - ayo.scrollDelta / 1;
            });
          }
         // return ayo;
        },
        child: Stack(
          children: <Widget>[
            Positioned(
              top: topOne,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFFd84801), Color(0xFFfe8b14)])),
                margin: const EdgeInsets.only(top: 20),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(top: 110, left: 30),
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Colors.white,
                ),
                margin: const EdgeInsets.fromLTRB(0, 180, 0, 0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Country:",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            DropdownButton<String>(
                              items: _countryList
                                  .map((String dropDownStringCountry) {
                                return DropdownMenuItem<String>(
                                  value: dropDownStringCountry,
                                  child: Text(dropDownStringCountry),
                                );
                              }).toList(),
                              onChanged: (String valueSelected) {
                                _dropDownCountrySelected(valueSelected);
                              },
                              value: _currentCountrySelected,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "State:",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            DropdownButton<String>(
                              items:
                                  _stateList.map((String dropDownStringState) {
                                return DropdownMenuItem<String>(
                                  value: dropDownStringState,
                                  child: Text(dropDownStringState),
                                );
                              }).toList(),
                              onChanged: (String valueStateSelected) {
                                _dropDownStateSelected(valueStateSelected);
                              },
                              value: _currentStateSelected,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          onChanged: (String val) =>
                              setState(() => _firstname = val),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "You can't have an empty name";
                            }
                            if (value.length < 2) {
                              return "Name must have more than one Character!";
                            }
                            //return value;
                          },
                          decoration: InputDecoration(
                            hintText: "Firstname",
                            labelText: "Firstname",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onChanged: (String val) =>
                              setState(() => _lastname = val),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "You can't have an empty name";
                            }
                            if (value.length < 2) {
                              return "Name must have more than one Character!";
                            }
                            //return value;
                          },
                          decoration: InputDecoration(
                            hintText: "Lastname",
                            labelText: "Lastname",
                            helperText: "Your surname",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onChanged: (String val) =>
                              setState(() => _email = val),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "You can't have an empty emil";
                            }
                            if (value.length < 12) {
                              //adewomi@gmail.com
                              return "email must have more than 12 Character!";
                            }
                            if (!value.contains("@")) {
                              return "@ what mail service";
                            }
                            if (!value.contains(".")) {
                              return " . what";
                            }
                            //return value;
                          },
                          decoration: InputDecoration(
                            hintText: "Email Address",
                            labelText: "Email Address",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: DropdownButton<String>(
                                items: _countryCode
                                    .map((String dropDownStringItem) {
                                  return DropdownMenuItem<String>(
                                    value: dropDownStringItem,
                                    child: Text(dropDownStringItem),
                                  );
                                }).toList(),
                                onChanged: (String valueSelected) {
                                  _dropDownItemSelected(valueSelected);
                                },
                                value: _currentItemSelected,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 3,
                              child: TextFormField(
                                onChanged: (String val) =>
                                    setState(() => _phoneNo = val),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "You can't have an empty PhoneNo";
                                  }
                                  if (value.length < 11) {
                                    //adewomi@gmail.com
                                    return "Phone Number must have 11 Character!";
                                  }
                                  //return value;
                                },
                                decoration: InputDecoration(
                                  hintText: "Phone Number",
                                  helperText: "Your phone number",
                                  labelText: "Phone Number",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onChanged: (String val) =>
                              setState(() => _password = val),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "You can't have an empty password";
                            }
                            if (value.length < 8) {
                              //adewomi@gmail.com
                              return "Password must have more than 7 Character!";
                            }
                            if (isPasswordCompliant(value) == false) {
                              //adewomi@gmail.com
                              return " Uppercase, lowercase and a symbol are required";
                            }
                            //return value;
                          },
                          obscureText: _showPassword,
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showPassword = !_showPassword;
                                });
                              },
                              child: _showPassword
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                            ),
                           
                            hintText: "Password",
                            helperText:
                                "Your must have an Uppecase, Lowercase a number and a symbol",
                            labelText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          onChanged: (String val) =>
                              setState(() => _confirmPassword = val),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "You must confirm your password";
                            }
                            if (_password != _confirmPassword) {
                              return "Your password did\'nt match";
                            }
                            //return value;
                          },
                          obscureText: _showConfirmPassword,
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showConfirmPassword = !_showConfirmPassword;
                                });
                              },
                              child: _showConfirmPassword
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                            ),
                            hintText: "Confirm Password",
                            labelText: "Confirm Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Checkbox(
                              value: true,
                              onChanged: null,
                              activeColor: Colors.orangeAccent,
                            ),
                            Text(
                              "I accept oneKiosk terms and conditions",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                        Builder(
                          builder: (BuildContext context) {
                            return InkWell(
                              onTap: () {
                                final form = _formKey.currentState;
                                sendFormData();
                                _formKey.currentState.save();
                                _formKey.currentState.validate()
                                    ? Scaffold.of(context)
                                        .showSnackBar(SnackBar(
                                        content: Text("The form is valid."),
                                      ))
                                    : Scaffold.of(context)
                                        .showSnackBar(SnackBar(
                                        content: Text("This is not valid."),
                                      ));

                                if (form.validate()) {
                                  form.save();
                                  sendFormData();
                                  sendgfData();
                                  performSignUp();
                                }
                                //Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //      builder: (context) => MyHomePage()));
                              },
                              child: Container(
                                height: 50.0,
                                width: 280.0,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey[100],
                                        offset: Offset(0, 6),
                                      ),
                                    ],
                                    gradient: LinearGradient(colors: [
                                      Color(0xFFd84801),
                                      Color(0xFFfe8b14)
                                    ]),
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(
                                      10.0,
                                    )),
                                child: Center(
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 55,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Future<User> createPost(String url, {Map body}) async {}

  Future<void> sendFormData() async {
    final stdPhoneNo = _currentItemSelected + _phoneNo.substring(1, 11);
    User userData = User(
      firstname: _firstname,
      lastname: _lastname,
      email: _email,
      country: _currentCountrySelected,
      password: _confirmPassword,
      phone: stdPhoneNo,
      state: _currentStateSelected,
      type:"user",
       // you noukel head you didn't add this line of code [non-sense]
    );
    var formBody = userData.toJson();
    String url = "http://onekiosk-api.herokuapp.com/api/v1/auth/signup";

    //var mybody = json.encode(formBody);
    // print(mybody);

    var response = await http.post(Uri.encodeFull(url),
        body: json.encode(formBody),
        headers: {'Content-Type': 'application/json; charset=UTF-8'});
// femi longe  Micro straction

   

    if (response.statusCode == 201) {
      print(response.body);
      print("Account Successfully created");
      //succeccfull created

      showModalBottomSheet(context: context, builder: (context){
        return Container(
          height: 300,
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset("images/exclamation-mark.png"),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Validation error", style: TextStyle(fontSize:18))
                ],
              ),
            ),
          ),
        );
      });

      setState(() {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => VerifyUser()));
      });
    }

    if (response.statusCode == 500) {
      print(response.body);
      print("server error"); //server error

      showModalBottomSheet(context: context, builder: (context){
        return Container(
          height: 300,
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset("images/exclamation-mark.png"),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Server error", style: TextStyle(fontSize:18))
                ],
              ),
            ),
          ),
        );
      });

    }

      //forbedin
      //422 validation error
      //404 not found
      //300 redirect
      //409 user already exist
    
    if (response.statusCode == 422) {
      // It is expected that this part of the code is not ment to run because it will not be fixed after production
      print(response.body);
      print("Validation error"); //created

      showModalBottomSheet(context: context, builder: (context){
        return Container(
          height: 300,
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset("images/exclamation-mark.png"),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Validation error", style: TextStyle(fontSize:18))
                ],
              ),
            ),
          ),
        );
      });
    }
    if (response.statusCode == 404) {
      print(response.body);
      print(" server not found");

      showModalBottomSheet(context: context, builder: (context){
        return Container(
          height: 300,
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset("images/exclamation-mark.png"),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Server not found", style: TextStyle(fontSize:18))
                ],
              ),
            ),
          ),
        );
      });
  }

    

    if (response.statusCode == 409) {
      print(response.body);
      print("user already exist");

      showModalBottomSheet(context: context, builder: (context){
        return Container(
          height: 300,
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset("images/exclamation-mark.png"),
                  SizedBox(
                    height: 15,
                  ),
                  Text("user already exist", style: TextStyle(fontSize:18))
                ],
              ),
            ),
          ),
        );
      });

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  // Future<void> getData() async {
  //   var response = await http.get(
  //       Uri.encodeFull("https://jsonplacheholder.typicode.com/posts"),
  //       headers: {"Accepts": "application/json"});
  //   print(response);
  //   List data = json.decode(response.body);
  //   print(data[0]["title"]);
  // }

  void _dropDownItemSelected(String valueSelected) {
    setState(() {
      this._currentItemSelected = valueSelected;
    });
  }

  void _dropDownCountrySelected(String valueSelected) {
    setState(() {
      this._currentCountrySelected = valueSelected;
    });
  }

  void _dropDownStateSelected(String valueStateSelected) {
    setState(() {
      this._currentStateSelected = valueStateSelected;
    });
  }
  // void _onButtomSheetCalled(String exception){
  //   showBottomSheet(context: context, builder: (context) (){
      
  //   })
  // }
}
