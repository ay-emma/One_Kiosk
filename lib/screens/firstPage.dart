import 'package:flutter/material.dart';
import 'package:one_kiosk/screens/login.dart';
import 'package:one_kiosk/screens/onboarding.dart';
import 'widgets/common_widgets.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Center(child: Image.asset("images/oneKioskLogo.png")),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  OrangeButton(
                    btnName:"Login",
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                 OrangeButton(
                    btnName:"SignUp",
                    onPressed: (){
                     // Navigator.push(context, MaterialPageRoute(builder: (context) => Onboarding()));
                     //CustomersServices.
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
