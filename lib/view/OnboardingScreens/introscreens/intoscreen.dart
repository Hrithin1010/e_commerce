
import 'package:e_commerce/email&pass_auth/registration.dart';
import 'package:e_commerce/view/HomePage.dart';
import 'package:e_commerce/view/OnboardingScreens/introscreens/intro1.dart';
import 'package:e_commerce/view/OnboardingScreens/introscreens/intro2.dart';
import 'package:e_commerce/view/OnboardingScreens/introscreens/intro3.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  //controller to keep track on which page were on
  PageController _controller = PageController();

  //keep track of if we are on the last page or not
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index){
              setState(() {
                onLastPage=(index==2);
              });
            },
            children: [
              Intropage1(),
              Intropage2(),
              Intropage3(),
            ],
          ),
          Container(
              alignment: Alignment(0, 0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //skip
                  GestureDetector(
                      onTap: () {
                        _controller.jumpToPage(2);
                      },
                      child: Text('skip')),
    
                  //dot indicator
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                  ),
                  //next or done
                  onLastPage?
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return RegistrationFire();
                        }));
                      },
                      child: Text('Done'))
                      : GestureDetector(
                      onTap: () {
                        _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                      child: Text('Next')),
                ],
              )),
        ],
      ),
    );
  }
}
