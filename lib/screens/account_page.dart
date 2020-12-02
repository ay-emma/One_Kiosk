import 'package:flutter/material.dart';

// import 'package:one_kiosk/screens/login.dart';
// import 'package:one_kiosk/screens/signUpPage.dart';
// import 'package:one_kiosk/screens/storehome.dart';


class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Account", style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
         mytiles("Information and Password", Icons.account_circle),
         mytiles("One Kiosk Pro", Icons.person_add  ),
         mytiles("Get your store Listed", Icons.local_convenience_store ),
         mytiles("Wallet", Icons.account_balance_wallet  ),
         mytiles("Orders", Icons.drag_handle  ),
         mytiles("Delivery", Icons.local_activity  ),
         mytiles("Payment Method", Icons.payment  ),
         mytiles("Credits", Icons.person_add  ),
         mytiles("Share", Icons.share ),
         mytiles("Help", Icons.help),
         mytiles("Privacy and Policies", Icons.note),
         mytiles("About One Kiosk", Icons.album ),
         mytiles("Log Out", Icons.all_out ),

        ],
      )
    );
  }
}

Widget mytiles(String data, IconData iconData){
  return Container(
    height: 46,
    child: ListTile(
      //contentPadding: EdgeInsets.all(2),
       leading: Icon(iconData ),
       title: Text(data),
    ),
  );
}

// Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             InkWell(
//                   onTap: () {
//                       Navigator.push(context, MaterialPageRoute( builder: (context) => SignUpPage() ));
//                     },  
//                     child: Container(
//                     height: 50.0,
//                     width:  220.0,
//                     decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey[100],
//                         offset: Offset(
//                           0,6
//                         ),
//                       ),
//                     ],
//                     gradient: LinearGradient(
//                       colors: [Color(0xFFd84801), Color(0xFFfe8b14)]
//                     ),
//                     color: Colors.orange,
//                     borderRadius: BorderRadius.circular(
//                         10.0,
//                     )
//                     ),
//                     child: Center(
//                       child: Text(
//                         "Sign Up", style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 15.0,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       Navigator.push(context, MaterialPageRoute( builder: (context) => LoginPage() ));
//                     },
//                     child: Container(
//                     height: 50.0,
//                     width:  220.0,
//                     decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey[100],
//                         offset: Offset(
//                           0,6
//                         ),
//                       ),
//                     ],
                    
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(
//                         10.0,
//                     )
//                     ),
//                     child: Center(
//                       child: Text(
//                         "Login", style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 15.0,
//                   ),

//                   InkWell(
//                     onTap: (){
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
//                     },
                    
//                     child: Container(
//                     height: 50.0,
//                     width:  220.0,
//                     decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey[100],
//                         offset: Offset(
//                           0,6
//                         ),
//                       ),
//                     ],
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(
//                         10.0,
//                     )
//                     ),
//                     child: Center(
//                       child: Text(
//                         "Sign Up Later", style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                     ),
//                   ),
//           ],
//         ),
//       ),