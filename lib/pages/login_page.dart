import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({
    super.key,
    required this.onTap,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailcontroler = TextEditingController();
  final pwdcontroleler = TextEditingController();

  void signUserIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroler.text, password: pwdcontroleler.text);
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
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
                    controller: emailcontroler,
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
                    controller: pwdcontroleler,
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
                      color: const Color.fromRGBO(3, 2, 64, 1.000),
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
                          signUserIn();
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
                  // Center(
                  //   child: SizedBox(
                  //     height: 50,
                  //     width: 500,
                  //     child: OutlinedButton(
                  //       onPressed: () {
                  //         Navigator.pushNamed(context, "signUpPage");
                  //       },
                  //       style: ButtonStyle(
                  //         shape:
                  //             MaterialStateProperty.all(RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(20.0),
                  //         )),
                  //       ),
                  //       child: const Text(
                  //         "Sign Up",
                  //         style: TextStyle(
                  //             fontSize: 18, color: Color.fromRGBO(3, 2, 64, 1)),
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      "Register Now",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromRGBO(3, 2, 64, 1.000),
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
