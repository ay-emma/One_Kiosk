
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_kiosk/onboarding/widgets/models/onboardPageModel.dart';


List<OnboardPageModel> onboardPageData = [
  OnboardPageModel(
    Colors.white,
    Color(0xFFf98712),
   
    3,
    "images/lady_on_bike.png",
    false,
    
    "#Quick Delivery",
    "On this channel you can become a pro distributing Goodsss. ",
  ),
  OnboardPageModel(
    Colors.white,
    Color(0xFFf98712),
   
    2,
    "images/image_map.png",
    false,
    
    "#StoresNearby",
    "Find and Shop from stores Around your Location ",
  ),
  OnboardPageModel(
    Colors.white,
    Color(0xFFf98712),
   
    1,
    "images/custormer_cart.png",
    true,
    
    "#SellYourProducts",
    " Add and Manage your stores ",
  ),


];