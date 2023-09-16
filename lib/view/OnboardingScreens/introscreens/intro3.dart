 import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Intropage3 extends StatelessWidget {
  const Intropage3({super.key});

  @override
  Widget build(BuildContext context) {
    return  
    Container(
      height: 300,
      width: 400,
      child: Lottie.asset("assets/animations/2.json")
    );
  }
}
 