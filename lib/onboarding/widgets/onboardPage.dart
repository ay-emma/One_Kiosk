import 'package:flutter/material.dart';
import 'package:one_kiosk/onboarding/widgets/drawerPaint.dart';
import 'package:one_kiosk/onboarding/widgets/models/onboardPageModel.dart';
import 'package:one_kiosk/screens/account_page.dart';
import 'package:one_kiosk/screens/signUpPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPage extends StatefulWidget {
  // You are going out by 3
  final OnboardPageModel pageModel;
  final PageController pageController;

  const OnboardingPage(
      {Key key, @required this.pageModel, @required this.pageController})
      : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> bounceAnimation;
  Animation<double> borderAnimation;

  setVisitingFlag() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("visited_Before", true);
  }

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 750));
    bounceAnimation = Tween<double>(begin: -40, end: 0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.bounceOut));
    borderAnimation = Tween<double>(begin: 75, end: 50).animate(
      CurvedAnimation(parent: animationController, curve: Curves.bounceOut),
    );

    animationController.forward(from: 0);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _nextButtonPressed() {
    widget.pageController.nextPage(
      duration: Duration(
        milliseconds: 100,
      ),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        color: widget.pageModel.primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            AnimatedBuilder(
                animation: bounceAnimation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(bounceAnimation.value, 0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 71.0),
                      child: Image.asset(
                        widget.pageModel.imagePath,
                        height: 220,
                        width: 220,
                      ),
                    ),
                  );
                }),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32.0,
              ),
              child: Container(
                height: 230,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(widget.pageModel.subhead,
                          style:
                         
                           TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: widget.pageModel.accentColor,
                            letterSpacing: 1,
                            fontStyle: FontStyle.normal,
                          )
                          ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(widget.pageModel.description,
                          style: 
                          TextStyle(
                            fontSize: 18.0,
                            color: widget.pageModel.accentColor,
                                  letterSpacing: 1,
                                   fontStyle: FontStyle.normal,
                          
                          ),
                      ))
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 60.0, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage() ));
                      setVisitingFlag();
                    },
                      child: Text(
                    "Skip",
                    style: TextStyle(color: Color(0xfff98712)),
                  )),
                  widget.pageModel.openbutton ? _buildbutton() : Container(),
                ],
              ),
            )
          ],
        ),
      ),
      Align(
        alignment: Alignment.centerRight,
        child: AnimatedBuilder(
            animation: borderAnimation,
            builder: (context, child) {
              return CustomPaint(
                painter: DrawerPaint(
                  curveColor: widget.pageModel.accentColor,
                ),
                child: Container(
                  width: borderAnimation.value,
                  height: double.infinity,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                        padding: const EdgeInsets.only(bottom: 24.0),
                        child: widget.pageModel.openbutton
                            ? Container()
                            : _iconbutton()),
                  ),
                ),
              );
            }),
      )
    ]);
  }

  Widget _iconbutton() {
    return IconButton(
      icon: Icon(
        Icons.arrow_forward,
        color: widget.pageModel.primaryColor,
        size: 32,
      ),
      onPressed: _nextButtonPressed,
    );
  }

  Widget _buildbutton() {
    return Material(
      borderRadius: BorderRadius.circular(8.0),
      child: InkWell(
        onTap: () {

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AccountPage()));
              setVisitingFlag();
        },
        child: Container(
          width: 90,
          height: 40,
          decoration: BoxDecoration(
            color: Color(0xFFf98712),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
              child: Text(
            "Get Started",
            style: TextStyle(color: Colors.white),
          )),
        ),
      ),
    );
  }
}
