import 'package:flutter/material.dart';
import 'package:one_kiosk/screens/storehome.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
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
              "Reset Password ?",
              style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 35),
            ),
            SizedBox(
              height: 30,
            ),
            Image.asset("images/forgot.png"),
            SizedBox(
              height: 25,
            ),
           
            SizedBox(
              height: 25,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "New Password",
                labelText: "New Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
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
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:(context) => MyHomePage() ));
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
        ),
    );
  }
}