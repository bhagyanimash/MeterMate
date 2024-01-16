import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              color: const Color.fromRGBO(3, 2, 64, 1.000),
              size: 70,
            ),
          ],
        ),
      ),
    );
  }
}
