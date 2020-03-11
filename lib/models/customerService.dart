import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomersServices {

  void _lunchUrl() async {
    // works for websites and google map
    const url = "http://www.OneKioskafrica.com";
    if(await canLaunch(url)){
      await launch(url);
    }
    else{
      throw "For some reason we could not open the link";
    }

  }

  void _launchCaller() async {
      var url = "tel:+2347036282764";
      String errorMassage = "For some reason we could not place the call";

      if(await canLaunch(url)){
        await launch(url);
      }
       else{
      throw "For some reason we could not place the call";
        }

  }

  void _launchEmail(String emailId) async {
    var url = "mailto:info@onekiosk.ng?subject = Your comaplain title";
     String errorMassage = "Could not send e-mail";
    if(await canLaunch(url)){
      await launch(url);
    }
    else {
      throw "Could not send e-mail"; 
    }
  }



 
}

// Link to about section
// Link to privacy police section
// Link to email for problems
// Link to phone number to contact