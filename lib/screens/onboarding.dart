import 'package:flutter/material.dart';
import 'package:one_kiosk/onboarding/widgets/data/onboardingPageData.dart';
import 'package:one_kiosk/onboarding/widgets/onboardPage.dart';

class Onboarding extends StatelessWidget {
final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Stack(
          children: <Widget>[
      PageView.builder(
      controller: pageController,
      // physics: NeverScrollableScrollPhysics(),
      itemCount: onboardPageData.length,
      itemBuilder: (context, index) {
        return OnboardingPage(
           pageController: pageController,
          pageModel: onboardPageData[index],
        );
      },
          ),
         
          ],
        ),
    );
  }
}