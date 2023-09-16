 import 'package:flutter/material.dart';
 import 'package:lottie/lottie.dart';

class Intropage2 extends StatelessWidget {
  const Intropage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 400,
      child: Lottie.asset('assets/animations/1.json')
    );
  }
}
 
 