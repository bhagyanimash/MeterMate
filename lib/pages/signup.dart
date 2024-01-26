import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';

import '../service/database.dart';

class SignUp extends StatefulWidget {
  final Function()? onTap;
  const SignUp({
    super.key,
    required this.onTap,
  });

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final usernamecontroler = TextEditingController();
  final pwdcontroler = TextEditingController();
  final confirmpwdcontroler = TextEditingController();
  final emailcontroler = TextEditingController();

  void signUserUp() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      if (pwdcontroler.text == confirmpwdcontroler.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailcontroler.text, password: pwdcontroler.text);
      } else {
        showErrorMessage("Password dosent match");
      }
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
              child: Text(message),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: const Color.fromRGBO(3, 2, 64, 1.000),
      //   // leading: IconButton(
      //   //     onPressed: () {
      //   //       Navigator.pushNamed(context, 'loginpage');
      //   //     },
      //   //     icon: const Icon(
      //   //       Icons.arrow_back,
      //   //     )),
      //   title: const Text(
      //     "Sign UP",
      //     style: TextStyle(
      //       color: Colors.white,
      //     ),
      //   ),
      // ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Image.asset(
                  'images/metermate.png',
                  width: 100,
                ),
              ),
              const SizedBox(
                height: 44.0,
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: emailcontroler,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: "Email Address",
                    prefixIcon: const Icon(
                      Icons.mail_outline,
                      color: Colors.black,
                    )),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: pwdcontroler,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: "Password",
                    prefixIcon: const Icon(
                      Icons.lock_outlined,
                      color: Colors.black,
                    )),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: confirmpwdcontroler,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: "Confirm Password",
                  prefixIcon: const Icon(
                    Icons.password,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 500,
                  child: RawMaterialButton(
                    fillColor: const Color.fromRGBO(3, 2, 64, 1.000),
                    //elevation: 0.0,
                    //padding: EdgeInsets.symmetric(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () async {
                      signUserUp();
                    },
                    child: const Text(
                      "Sign UP",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: GestureDetector(
                  onTap: widget.onTap,
                  child: const Text(
                    "Login Now",
                    style: TextStyle(
                      color: Color.fromRGBO(3, 2, 64, 1.000),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
