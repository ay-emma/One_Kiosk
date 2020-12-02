import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'FlutterMockD/models/cartModel.dart';
import 'models/loginUserModel.dart';
import 'screens/onboarding.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartProvider>(
            create: (BuildContext context) => CartProvider()),
        ChangeNotifierProvider<LoginUserModel>(
          create: (BuildContext context) => LoginUserModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'One Kiosk',
        theme: ThemeData(
          // This is the theme of your application.
          fontFamily: 'Montserrat',
          primarySwatch: Colors.orange,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        home: Onboarding(),
      ),
    );
  }
}
