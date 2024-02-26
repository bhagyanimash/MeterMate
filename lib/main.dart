import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:metermate/firebase_options.dart';
import 'package:metermate/pages/add_account_page.dart';
import 'package:metermate/pages/auth_page.dart';
import 'package:metermate/pages/home_page.dart';
import 'package:metermate/pages/loading_page.dart';
import 'package:metermate/pages/login_page.dart';
import 'package:metermate/pages/qr_scan_page.dart';
import 'package:metermate/pages/signup.dart';
import 'package:metermate/pages/signup_page.dart';
import 'package:metermate/pages/user_details.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MeterMate());
}

class MeterMate extends StatelessWidget {
  const MeterMate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoadingPage(),
      routes: {
        //'loginPage': (context) => const LoginPage(),
        'signUpPage': (context) => const SignUpPage(),
        'homePage': (context) => const HomePage(),
        'scanPage': (context) => const QRscanPage(),
        'userDetails': (context) => const UserDetail(),
        'authPage': (context) => const AuthPage(),
        'addAccountPage': (context) => const AddAccountPage()
      },
    );
  }
}
