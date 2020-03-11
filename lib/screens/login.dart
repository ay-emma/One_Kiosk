import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:one_kiosk/models/loginUser.dart';
import 'package:one_kiosk/screens/forgotPasswordPage.dart';
import 'package:one_kiosk/screens/signUpPage.dart';
import 'package:one_kiosk/screens/storehome.dart';
import 'package:http/http.dart' as http;
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

  RateMyApp _rateMyApp = RateMyApp(
  preferencesPrefix: 'rateMyApp_',
  minDays: 3,
  minLaunches: 5,
  remindDays: 3,
  remindLaunches: 10,
  //googlePlayIdentifier: "com.onekioskafrica.one_kiosk",
  //appStoreIdentifier: '',
  ); 

  @override
  void initState() {
    _rateMyApp.init().then((_){
      if(_rateMyApp.shouldOpenDialog){
        _rateMyApp.showStarRateDialog(
          context,
          title: "Enjoying OneKiosk App ?",
          message: "Please leave a rating!",
          onRatingChanged: (stars){
            return[
              FlatButton(
                onPressed: (){
                  if(stars != null) {
                     _rateMyApp.save().then((v) => Navigator.pop(context) );
                     if (stars <= 3 ){
                       print("navigate to contact us Screen");
                       //Navigate to Contact Us Screen
                      //  Navigator.push(
                      //   //  context, MaterialPageRoute(
                      //   //    builder: (_) => ContactUsScreen(), ) 
                           
                      // );
                     }

                     else if ( stars <= 5) {
                       // Things to be done here is to send the user to google play store
                       print("please leave a review ");
                      // showDialog(...context: )
                     }
                  }else {
                    Navigator.pop(context);
                  }
                },
                child: Text("RATE"),
                 )
            ];
          },
          dialogStyle: DialogStyle(
            titleAlign:  TextAlign.center,
            messageAlign: TextAlign.center,
            messagePadding: EdgeInsets.only(bottom: 20),
          ),
          starRatingOptions: StarRatingOptions(),
          
          );
      }
    }); 
    super.initState();
  }

  void performLogin() {
    print("did you get it o");
    showBottomSheet(context: context, builder: (context){
      return Container(
        color: Colors.transparent,
        height: 200,
        child: Container(
           decoration: BoxDecoration(

            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(20),
              topRight: const Radius.circular(20),
            )
          ),
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
                          onChanged: (String val) =>
                              setState(() => _username = val),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "You can't have an empty emil";
                            }
                            if (value.length < 11) {
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
                          onChanged: (String val) =>
                              setState(() => _password = val),
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
                        Builder(builder: (BuildContext context ) {
                          return InkWell(
                          onTap: () {
                             final form = _formKey.currentState;

                                _formKey.currentState.save();
                                _formKey.currentState.validate()
                                    ? Scaffold.of(context)
                                        .showSnackBar(SnackBar(
                                         content: Text("Valid you are good to go !."),
                                      ))
                                    : Scaffold.of(context)
                                        .showSnackBar(SnackBar(
                                        content: Text("This form is not valid."),
                                      ));

                                if (form.validate()) {
                                  form.save();
                                  sendLoginFormData(context);
                                  performLogin();
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
                        }
                        
                        
                        ),
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
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                color: Colors.blue,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 8),
                                  child: Text("Facebook",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                              RaisedButton(
                                onPressed: () {
                                  _signIn()
                                      .then((FirebaseUser user) {

                                        setState(() {

                                        });
                                      print(user);}

                                      )

                                      .catchError((e) => print(e));
                                  setState(() {

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MyHomePage())
                                    );
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
      username : _username,
      password : _password,
    );
    var formBody = loginUser.toJson();

    //http://onekiosk-api.herokuapp.com/api/v1/auth/login
    
    String url = "http://onekiosk-api.herokuapp.com/api/v1/auth/login";

    var response = await http.post(
      Uri.encodeFull(url),
      body: json.encode(formBody),
      headers: {'Content-Type': 'application/json; charset=UTF-8'}
    );

    String message = json.decode(response.body).toString();

      if(response.statusCode == 200 ){
        print("Logged in successfully + message __"+ message );
        print(response.body);

        setState(() {
        Navigator.push(context, MaterialPageRoute(builder:(context) =>MyHomePage()));

        });
         
      }

       if(response.statusCode == 401){
         print("Either Username or password is wroong");
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
                 Text("Either Username or password is wroong", style: TextStyle(fontSize:18))
            ],
                ),
              ),
            ),
           );
         }  );
       
      }

      if(response.statusCode == 404){
         print("user does not exist");
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
                 Text("user does not exist", style: TextStyle(fontSize:18))
            ],
                ),
              ),
            ),
           );
         }
         );
       
      }

      if(response.statusCode == 422){
        print("validation error");
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
         }  );

      }

      if(response.statusCode == 500){
         
        print("Server Error");

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
                Text("Internal Server Error", style: TextStyle(fontSize:18))
            ],
                ),
              ),
            ),
           );
         }  );
      }
  }
}

// showBottomSheet(context: context, builder: (context){
//       return Container(
//         color: Colors.transparent,
//         height: 200,
//         child: Container(
//            decoration: BoxDecoration(

//             color: Theme.of(context).canvasColor,
//             borderRadius: BorderRadius.only(
//               topLeft: const Radius.circular(20),
//               topRight: const Radius.circular(20),
//             )
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               SizedBox(
//                 height: 20,
//               ),
//               Image.asset("exclamation-mark"),
//               SizedBox(
//                 height: 15,
//               ),
//               Text(exception, style: TextStyle(fontSize:18))
//             ],
//           ),
//         ),
        
//       ); 
//     })
//