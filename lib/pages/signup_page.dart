import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  iconSize: 30,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
              Center(
                child: Image.asset(
                  'images/metermate.png',
                  width: 100,
                ),
              ),
              const SizedBox(
                height: 44.0,
              ),
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: "Username",
                    prefixIcon: const Icon(
                      Icons.person_outline,
                      color: Colors.black,
                    )),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                obscureText: true,
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
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: "Re-Enter Password",
                  prefixIcon: const Icon(
                    Icons.password,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: "Contact Number",
                  prefixIcon: const Icon(
                    Icons.call_outlined,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: "NIC Number",
                  prefixIcon: const Icon(
                    Icons.dock,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              Center(
                child: RawMaterialButton(
                  fillColor: const Color.fromRGBO(3, 2, 64, 1.000),
                  //elevation: 0.0,
                  //padding: EdgeInsets.symmetric(),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () {},
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
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
