import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

void main() {
  runApp(const Metermate());
}

class Metermate extends StatelessWidget {
  const Metermate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/metermate.png',
                width: 125,
              ),
              LoadingAnimationWidget.prograssiveDots(
                  color: const Color.fromRGBO(3, 2, 64, 1.000), size: 70)
            ],
          ),
        ),
      ),
    );
  }
}
