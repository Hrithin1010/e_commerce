import 'dart:async';
import 'package:e_commerce/provider/dataProvider.dart';
import 'package:e_commerce/view/OnboardingScreens/introscreens/intoscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
        create: (context) => dataProvider(),
        child: GetMaterialApp(
          useInheritedMediaQuery: true,
          home: splash(),
          debugShowCheckedModeBanner: false,
        )),
  );
}

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => IntroScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
            height: 300,
            width: 300,
            child: Image.asset('assets/images/shop-me-logo.png')),
      ),
    );
  }
}




// import 'package:e_commerce/firebase/views/auth/login_screen.dart';
// import 'package:e_commerce/firebase/views/splashScreen.dart';
// import 'package:e_commerce/view/HomePage.dart';
// import 'package:e_commerce/view/OnboardingScreens/introscreens/intro1.dart';
// import 'package:e_commerce/view/OnboardingScreens/introscreens/intro2.dart';
// import 'package:e_commerce/view/OnboardingScreens/introscreens/intro3.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// void main()async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(app()
//   );
// }

// class app extends StatelessWidget {
//   const app({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: LoginScreen());
//   }
// }
  

// class IntroScreen extends StatefulWidget {
//   const IntroScreen({super.key});

//   @override
//   State<IntroScreen> createState() => _IntroScreenState();
// }

// class _IntroScreenState extends State<IntroScreen> {

//   //controller to keep track on which page were on
//   PageController _controller = PageController();

//   //keep track of if we are on the last page or not
//   bool onLastPage = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           PageView(
//             controller: _controller,
//             onPageChanged: (index){
//               setState(() {
//                 onLastPage=(index==2);
//               });
//             },
//             children: [
//               Intropage1(),
//               Intropage2(),
//               Intropage3(),
//             ],
//           ),
//           Container(
//               alignment: Alignment(0, 0.75),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   //skip
//                   GestureDetector(
//                       onTap: () {
//                         _controller.jumpToPage(2);
//                       },
//                       child: Text('skip')),
    
//                   //dot indicator
//                   SmoothPageIndicator(
//                     controller: _controller,
//                     count: 3,
//                   ),
//                   //next or done
//                   onLastPage?
//                   GestureDetector(
//                       onTap: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (context){
//                           return HomeApi();
//                         }));
//                       },
//                       child: Text('Done'))
//                       : GestureDetector(
//                       onTap: () {
//                         _controller.nextPage(
//                             duration: Duration(milliseconds: 500),
//                             curve: Curves.easeIn);
//                       },
//                       child: Text('Next')),
//                 ],
//               )),
//         ],
//       ),
//     );
//   }
// }
