import 'package:flutter/material.dart';
import 'package:one_kiosk/screens/account_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/onboarding.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {

  setVisitingFlag() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("visited_Before", true);
  }

  getVisitingFlag() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool alreadyVisitedBefore = preferences.getBool("visited_Before") ?? false;
    return alreadyVisitedBefore;
  }
  
//  Widget myflag() {
//    bool whatFlag;
//     Future<void> _flag() async {
//       bool visitinngFlag = await getVisitingFlag();
//       if (visitinngFlag == true) {
//         return whatFlag = true;//MyHomePage();
//       } else {
//         return whatFlag = false; //Onboarding();
//       }
//     }

//           whichWidget(){
//             if(whatFlag == false ){
//               setVisitingFlag();
//               return Onboarding();
//             }
//             else{
//               return AccountPage();
//             }
//           }
//     return whichWidget();
    
    
//   }

void goingToAcctPage(){
  setVisitingFlag();

}

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        fontFamily: 'Montserrat',
        primarySwatch: Colors.orange,
      ),
      home: getVisitingFlag() == true ? AccountPage() : Onboarding(),
        //Onboarding(),
      );
    
  }

  
}
