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



