import 'package:flutter/material.dart';
import 'package:one_kiosk/screens/resetPasswordPage.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
                  child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 23,
            ),
            Text(
              "Forgot Password ?",
              style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 35),
            ),
            SizedBox(
              height: 30,
            ),
            Icon(
              Icons.lock,
              size: 200,
              color: Colors.orange,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Enter the email address associated with your account",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 23,
            ),
            Text(
              "We will email you a link to reset your password.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Email",
                labelText: "Email address",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPasswordPage() ));
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
                    gradient: LinearGradient(
                        colors: [Color(0xFFd84801), Color(0xFFfe8b14)]),
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(
                      10.0,
                    )),
                child: Center(
                  child: Text(
                    "Send",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
      ),
    ),
        ));
  }
}
