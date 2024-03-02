import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
  final TextEditingController usernamecontroler = TextEditingController();
  final pwdcontroler = TextEditingController();
  final confirmpwdcontroler = TextEditingController();
  final emailcontroler = TextEditingController();
  String? _username;

  Future<void> signUserUp() async {
    // Show loading indicator
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    if (pwdcontroler.text != confirmpwdcontroler.text) {
      if (mounted) Navigator.pop(context); // Close the loading indicator
      showErrorMessage("Passwords doesn't match");
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailcontroler.text, password: pwdcontroler.text);

      if (!mounted) return; // Check if the widget is still mounted

      _username = usernamecontroler.text; // Set _username and trigger UI update

      if (mounted) Navigator.pop(context); // Close the loading indicator
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        Navigator.pop(
            context); // Make sure to pop the loading indicator in case of an error
        showErrorMessage(e.code); // Show the error message
      }
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
                height: 40,
              ),
              Center(
                child: Image.asset(
                  'images/metermate.png',
                  width: 100,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  "Username",
                  style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(3, 2, 64, 1.000),
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                controller: usernamecontroler,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: "Username",
                    prefixIcon: const Icon(
                      Icons.account_circle_outlined,
                      color: Colors.black,
                    )),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  "Email Address",
                  style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(3, 2, 64, 1.000),
                      fontWeight: FontWeight.bold),
                ),
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
              const Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  "Password",
                  style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(3, 2, 64, 1.000),
                      fontWeight: FontWeight.bold),
                ),
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
              const Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  "Confirm Password",
                  style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(3, 2, 64, 1.000),
                      fontWeight: FontWeight.bold),
                ),
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
                height: 40.0,
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
                      //Navigator.pushNamed(context, 'loginPage');
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
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
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
