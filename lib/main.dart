import 'package:flutter/material.dart';
import 'package:metermate/pages/home_page.dart';
import 'package:metermate/pages/loading_page.dart';
import 'package:metermate/pages/login_page.dart';
import 'package:metermate/pages/signup_page.dart';

void main() {
  runApp(const MeterMate());
}

class MeterMate extends StatelessWidget {
  const MeterMate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      routes: {
        'loginPage': (context) => const LoginPage(),
        'signUpPage': (context) => const SignUpPage(),
        'homePage': (context) => const HomePage()
      },
    );
  }
}
