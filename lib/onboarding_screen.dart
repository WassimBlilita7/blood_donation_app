import 'package:blood_donation_app/constants.dart';
import 'package:blood_donation_app/intro_screens/intro_page_1.dart';
import 'package:blood_donation_app/intro_screens/intro_page_2.dart';
import 'package:blood_donation_app/intro_screens/intro_page_3.dart';
import 'package:blood_donation_app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();

  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          children: [
            IntroPage1(),
            IntroPage2(),
            IntroPage3(),
          ],
        ),
        Container(
          alignment: Alignment(0, 0.8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  _controller.jumpToPage(2);
                },
                child: Text('Skip' , style: TextStyle(
                  fontFamily: 'Alkatra',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),),
              ),
              SmoothPageIndicator(controller: _controller,
               count: 3 ,
               axisDirection: Axis.horizontal,
               effect: SlideEffect(activeDotColor: kPrimaryColor),
                ),
              onLastPage
                  ? GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        },
                        ),
                        );
                      },
                      child: Text('Done' , style: TextStyle(
                        fontFamily: 'Alkatra',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      )
                      ,),
                    )
                  : GestureDetector(
                      onTap: () {
                        _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                      child: Text('Next' , style: TextStyle(
                        fontFamily: 'Alkatra',
                         fontSize: 20,
                         fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),)
            ],
          ),
        )
      ],
    ));
  }
}
