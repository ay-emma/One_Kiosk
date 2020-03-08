import 'package:flutter/material.dart';
import 'package:one_kiosk/screens/resetPasswordPage.dart';

class EnterYourLocationPage extends StatefulWidget {
  @override
  _EnterYourLocationPageState createState() => _EnterYourLocationPageState();
}

class _EnterYourLocationPageState extends State<EnterYourLocationPage> {
  double topOne = 0;
  double topTwo = 110;

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
                   colors: [Color(0xFFd84801), Color(0xFFfe8b14)]
                  )
                ),
               
                margin: const EdgeInsets.only(top: 20),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(top: 100, left: 30 ),
                  child: Text("Enter your location",  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                  ),),
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
                  padding: const EdgeInsets.symmetric( horizontal: 25 ),
                  child: Column(
                    
                    children: <Widget>[
                      SizedBox(
                        height: 80,
                      ),
                     
                      
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Country",
                          labelText: "Country",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "State",
                          labelText: "State",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                       SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Address",
                          labelText: "Address",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResetPasswordPage()));
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
                              "Get Started",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
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
}
