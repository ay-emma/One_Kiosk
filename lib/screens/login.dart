import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:one_kiosk/FlutterMockD/StorePage.dart';
import 'package:one_kiosk/models/loginUser.dart';
import 'package:one_kiosk/models/loginUserModel.dart';
import 'package:one_kiosk/screens/forgotPasswordPage.dart';
import 'package:one_kiosk/screens/signUpPage.dart';
import 'package:one_kiosk/screens/storehome.dart';
import 'package:http/http.dart' as http;
import 'package:one_kiosk/screens/widgets/common_widgets.dart';
import 'package:provider/provider.dart';
import 'package:rate_my_app/rate_my_app.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  //final GlobalKey<ScaffoldState> _scaffoldstate = GlobalKey<ScaffoldState>();
  double topOne = 0;
  double topTwo = 110;
  String _username = "";
  String _password = "";

  // RateMyApp _rateMyApp = RateMyApp(
  // preferencesPrefix: 'rateMyApp_',
  // minDays: 3,
  // minLaunches: 5,
  // remindDays: 3,
  // remindLaunches: 10,
  // //googlePlayIdentifier: "com.onekioskafrica.one_kiosk",
  // //appStoreIdentifier: '',
  // );

  // @override
  // void initState() {
  //   _rateMyApp.init().then((_){
  //     if(_rateMyApp.shouldOpenDialog){
  //       _rateMyApp.showStarRateDialog(
  //         context,
  //         title: "Enjoying OneKiosk App ?",
  //         message: "Please leave a rating!",
  //         onRatingChanged: (stars){
  //           return[
  //             FlatButton(
  //               onPressed: (){
  //                 if(stars != null) {
  //                    _rateMyApp.save().then((v) => Navigator.pop(context));
  //                    if (stars <= 3 ){
  //                      print("navigate to contact us Screen");
  //                      //Navigate to Contact Us Screen
  //                     //  Navigator.push(
  //                     //   //  context, MaterialPageRoute(
  //                     //   //    builder: (_) => ContactUsScreen(), )

  //                     // );
  //                    }

  //                    else if ( stars <= 5) {
  //                      // Things to be done here is to send the user to google play store
  //                      print("please leave a review ");
  //                     // showDialog(...context: )
  //                    }
  //                 }else {
  //                   Navigator.pop(context);
  //                 }
  //               },
  //               child: Text("RATE"),
  //                )
  //           ];
  //         },
  //         dialogStyle: DialogStyle(
  //           titleAlign:  TextAlign.center,
  //           messageAlign: TextAlign.center,
  //           messagePadding: EdgeInsets.only(bottom: 20),
  //         ),
  //         starRatingOptions: StarRatingOptions(),

  //         );
  //     }
  //   });
  //   super.initState();
  // }

// perform login shows a bottom sheet

  void performLogin() {
    print("did you get it o");
    showBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Colors.transparent,
            height: 200,
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20),
                    topRight: const Radius.circular(20),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset("exclamation-mark"),
                  SizedBox(
                    height: 15,
                  ),
                  // Text(exception, style: TextStyle(fontSize:18))
                ],
              ),
            ),
          );
        });
    //sendData();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<FirebaseUser> _signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    print("Sign in " + user.displayName);

    return user;
  }

  @override
  Widget build(BuildContext context) {
    var loginUserModel = Provider.of<LoginUserModel>(context);

    return Scaffold(
      body: NotificationListener(
        onNotification: (ayo) {
          if (ayo is ScrollUpdateNotification) {
            setState(() {
              topOne = topOne - ayo.scrollDelta / 3;
              topTwo = topTwo - ayo.scrollDelta / 1;
            });
          }
          return true;
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
                    "Login",
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
                margin: const EdgeInsets.fromLTRB(0, 170, 0, 0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onChanged: (String val) => setState(() {
                            _username = val;
                            //loginUserModel.setUsername(val);
                          }),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "You can't have an empty emil";
                            } else if (value.length < 11) {
                              //adewomi@gmail.com
                              return "email must have more than 12 Character!";
                            }

                            //return value;
                          },
                          decoration: InputDecoration(
                            hintText: "Email or PhoneNo",
                            labelText: "Email or PhoneNo",
                            helperText: "Email or PhoneNo",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onChanged: (String val) => setState(() {
                            _password = val;
                            //loginUserModel.setPassword(val);
                          }),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "You can't have an empty password";
                            }
                            //return value;
                          },
                          decoration: InputDecoration(
                            hintText: "Password",
                            labelText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Builder(builder: (BuildContext context) {
                          return InkWell(
                            onTap: () {
                              final form = _formKey.currentState;

                              _formKey.currentState.save();
                              _formKey.currentState.validate()
                                  ? Scaffold.of(context).showSnackBar(SnackBar(
                                      content:
                                          Text("Valid you are good to go !."),
                                    ))
                                  : Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text("This form is not valid."),
                                    ));

                              if (form.validate()) {
                                final auth = Provider.of<LoginUserModel>(
                                    context,
                                    listen: false);
                                form.save();
                                auth
                                    .auth(passWord: _password, eMail: _username)
                                    .then((value) {
                                  if (value) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => StorePage()));
                                  } else {
                                    Scaffold.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            "either wrong password ore email or no acct registerd"),
                                      ),
                                    );
                                    print(
                                        "either wrong password ore email or no acct registerd");
                                  }
                                });

                                // sendLoginFormData(context);
                                // performLogin();
                              }
                            },
                            child: Container(
                              height: 50.0,
                              width: 310.0,
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
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ForgotPasswordPage()));
                            },
                            child: Text(
                              "Forgot password",
                              style: TextStyle(color: Colors.red),
                            )),
                        SizedBox(
                          height: 8,
                        ),
                        Divider(),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Login with",
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              RaisedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyHomePage()));
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                color: Colors.blue,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 8),
                                  // auth for facebook not yet done
                                  child: Text("Facebook",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                              RaisedButton(
                                onPressed: () {
                                  _signIn().then((FirebaseUser user) {
                                    setState(() {});
                                    print(user);
                                  }).catchError((e) => print(e));
                                  setState(() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MyHomePage()));
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                color: Colors.redAccent,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 11),
                                  child: Text("Google",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Don't have an account",
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUpPage()));
                                },
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                      color: Colors.orange, fontSize: 18),
                                )),
                          ],
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

  Future<void> sendLoginFormData(context) async {
    LoginUser loginUser = LoginUser(
      username: _username,
      password: _password,
    );
    var formBody = loginUser.toJson();

    //http://onekiosk-api.herokuapp.com/api/v1/auth/login

    String url = "http://onekiosk-api.herokuapp.com/api/v1/auth/login";

    var response = await http.post(Uri.encodeFull(url),
        body: json.encode(formBody),
        headers: {'Content-Type': 'application/json; charset=UTF-8'});

    String message = json.decode(response.body).toString();

    if (response.statusCode == 200) {
      print("Logged in successfully + message __" + message);
      print(response.body);

      setState(() {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyHomePage()));
      });
    }

    if (response.statusCode == 401) {
      print("Either Username or password is wrong");
      showmybottomsheets(context, "Either Username or password is wrong");
    }

    if (response.statusCode == 404) {
      print("user does not exist");
      showmybottomsheets(context, "user does not exist");
    }

    if (response.statusCode == 422) {
      print("validation error");
      showmybottomsheets(context, "validation error");
    }

    if (response.statusCode == 500) {
      print("Server Error");
      showmybottomsheets(context, "Server Error");
    }
  }
}

// RateMyApp rateMyApp = RateMyApp(
//   preferencesPrefix: 'rateMyApp_',
//   minDays: 7,
//   minLaunches: 10,
//   remindDays: 7,
//   remindLaunches: 10,
//   googlePlayIdentifier: 'fr.skyost.example',
//   appStoreIdentifier: '1491556149',
// );

// rateMyApp.init().then((_) {
//   if (rateMyApp.shouldOpenDialog) {
//     rateMyApp.showRateDialog(
//       context,
//       title: 'Rate this app', // The dialog title.
//       message: 'If you like this app, please take a little bit of your time to review it !\nIt really helps us and it shouldn\'t take you more than one minute.', // The dialog message.
//       rateButton: 'RATE', // The dialog "rate" button text.
//       noButton: 'NO THANKS', // The dialog "no" button text.
//       laterButton: 'MAYBE LATER', // The dialog "later" button text.
//       listener: (button) { // The button click listener (useful if you want to cancel the click event).
//         switch(button) {
//           case RateMyAppDialogButton.rate:
//             print('Clicked on "Rate".');
//             break;
//           case RateMyAppDialogButton.later:
//             print('Clicked on "Later".');
//             break;
//           case RateMyAppDialogButton.no:
//             print('Clicked on "No".');
//             break;
//         }

//         return true; // Return false if you want to cancel the click event.
//       },
//       ignoreIOS: false, // Set to false if you want to show the native Apple app rating dialog on iOS.
//       dialogStyle: DialogStyle(), // Custom dialog styles.
//       onDismissed: () => rateMyApp.callEvent(RateMyAppEventType.laterButtonPressed), // Called when the user dismissed the dialog (either by taping outside or by pressing the "back" button).
//       // actionsBuilder: (_) => [], // This one allows you to use your own buttons.
//     );

//     // Or if you prefer to show a star rating bar :

//     rateMyApp.showStarRateDialog(
//       context,
//       title: 'Rate this app', // The dialog title.
//       message: 'You like this app ? Then take a little bit of your time to leave a rating :', // The dialog message.
//       actionsBuilder: (_, stars) { // Triggered when the user updates the star rating.
//         return [ // Return a list of actions (that will be shown at the bottom of the dialog).
//           FlatButton(
//             child: Text('OK'),
//             onPressed: () async {
//               print('Thanks for the ' + (stars == null ? '0' : stars.round().toString()) + ' star(s) !');
//               // You can handle the result as you want (for instance if the user puts 1 star then open your contact page, if he puts more then open the store page, etc...).
//               // This allows to mimic the behavior of the default "Rate" button. See "Advanced > Broadcasting events" for more information :
//               await rateMyApp.callEvent(RateMyAppEventType.rateButtonPressed);
//               Navigator.pop<RateMyAppDialogButton>(context, RateMyAppDialogButton.rate);
//             },
//           ),
//         ];
//       },
//       ignoreIOS: false, // Set to false if you want to show the native Apple app rating dialog on iOS.
//       dialogStyle: DialogStyle( // Custom dialog styles.
//         titleAlign: TextAlign.center,
//         messageAlign: TextAlign.center,
//         messagePadding: EdgeInsets.only(bottom: 20),
//       ),
//       starRatingOptions: StarRatingOptions(), // Custom star bar rating options.
//       onDismissed: () => rateMyApp.callEvent(RateMyAppEventType.laterButtonPressed), // Called when the user dismissed the dialog (either by taping outside or by pressing the "back" button).
//     );
//   }
// });
