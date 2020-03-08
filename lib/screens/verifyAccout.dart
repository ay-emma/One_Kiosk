import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:one_kiosk/models/testinghttp.dart';
import 'package:http/http.dart' as http;
import 'package:one_kiosk/screens/storehome.dart';

class VerifyUser extends StatefulWidget {
  @override
  _VerifyUserState createState() => _VerifyUserState();
}

class _VerifyUserState extends State<VerifyUser> {
  double topOne = 0;
  double topTwo = 110;

  String _code = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NotificationListener(
        onNotification: (ayo) {
          if (ayo is ScrollUpdateNotification) {
            setState(() {
              topOne = topOne - ayo.scrollDelta / 3;
              topTwo = topTwo - ayo.scrollDelta / 1;
            });
          }
          return ayo;
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
                  padding: const EdgeInsets.only(top: 100, left: 30),
                  child: Text(
                    "Verify Email",
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
                  padding: const EdgeInsets.symmetric(horizontal: 45),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 80,
                      ),
                      Text(
                        "Enter the 6 digit code we sent to your Phone Number or Email to continue",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 65,
                      ),
                      TextFormField(
                        onChanged: (String val) => setState(() => _code = val),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "You must put in the 6 digit code sent to you";
                          }
                          if (value.length < 6) {
                            return " It is meant to be a six digit code ";
                          }
                          return value;
                        },
                        decoration: InputDecoration(
                          hintText: "Code",
                          labelText: "Code",
                          helperText: "fill in the 6 digit code sent to you",
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Builder(
                        builder: (BuildContext context) {
                          return InkWell(
                            onTap: () {
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
                                  "Continue",
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
                      Text("Click here to resend the code"),
                      SizedBox(
                        height: 55,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> verifyUser() async {
    const String url =
        "http://onekiosk-api.herokuapp.com/api/v1/auth/activate/token";

    ActivateUser userToken = ActivateUser(
      token: _code,
    );

    var tokenBody = userToken.toJson();
    //var myBody = json.encode(tokenBody);

    var response = await http.post(
      Uri.encodeFull(url),
      body: json.encode(tokenBody),

      headers: {'Content-Type' : 'application/json; charset = UTF-8'}
    );

    if(response.statusCode == 200){
      print(response.body);
      print("Activated Successfully");
      setState(() {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyHomePage()));
      });
      return response.body;
    }

    if(response.statusCode == 404 ){

       print(response.body);
      print("Token is invalid");
      return response.body;
    }

    if(response.statusCode == 422 ){

       print(response.body);
      print("Validation Error");
      return response.body;
    }

    if( response.statusCode == 500 ){

      print(response.body);
      print("Server Error");

    }

    //200
    //404
    //422
    //500

  }
}
