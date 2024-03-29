import 'dart:io';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // IconButton(
                  //     iconSize: 30,
                  //     onPressed: () {
                  //       exit(0);
                  //     },
                  //     icon: const Icon(
                  //       Icons.arrow_back,
                  //       color: Colors.black,
                  //     )),
                  Center(
                    child: Image.asset(
                      'images/metermate.png',
                      width: 125,
                    ),
                  ),
                  const SizedBox(
                    height: 44.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: "User Email",
                      prefixIcon: const Icon(
                        Icons.mail,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 26.0,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        hintText: "Password",
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.black,
                        )),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Color.fromRGBO(
                        3,
                        2,
                        64,
                        1.000,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
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
                        onPressed: () {
                          Navigator.pushNamed(context, 'homePage');
                        },
                        child: const Text(
                          "Log in",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Center(
                    child: SizedBox(
                      child: Text("or"),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: SizedBox(
                      height: 50,
                      width: 500,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'signUpPage');
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          )),
                        ),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 18, color: Color.fromRGBO(3, 2, 64, 1)),
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
