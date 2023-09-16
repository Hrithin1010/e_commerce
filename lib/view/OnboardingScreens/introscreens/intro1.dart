import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Intropage1 extends StatelessWidget {
  const Intropage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 300,
      child: Lottie.asset("assets/animations/animation_llg41hfa.json",fit: BoxFit.contain),
    );
  }
}