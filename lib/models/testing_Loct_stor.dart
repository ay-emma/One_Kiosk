
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class GetStoresByLocation with ChangeNotifier {
  final String location;

  GetStoresByLocation({this.location});

  Map<String, dynamic > toJson ()
  {
    return {
      "location" : location,
    };
  }

 Future<void> locationData() async {

   GetStoresByLocation userlocation = GetStoresByLocation(
     location : "maryland",
   );

  String url = "http://onekiosk-api.herokuapp.com/api/v1/auth/signup";

  var response = await http.post(
    Uri.encodeFull(url),
    body: json.encode(userlocation.toJson()),
    headers: {"Content-Type" : "application/json; charset =UTF-8"}
  );

  print(response.body);

 }


 //NotificationListener

}