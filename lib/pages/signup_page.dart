import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../service/database.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController usernamecontroler = new TextEditingController();
  TextEditingController pwdcontroler = new TextEditingController();
  TextEditingController repwdcontroler = new TextEditingController();
  TextEditingController emailcontroler = new TextEditingController();
  TextEditingController contactcontroler = new TextEditingController();
  TextEditingController idcontroler = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(233, 230, 242, 1.000),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
            )),
        title: const Text(
          "Sign UP",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // IconButton(
              //     iconSize: 30,
              //     onPressed: () {
              //       Navigator.pushNamed(context, 'loginPage');
              //     },
              //     icon: const Icon(
              //       Icons.arrow_back,
              //       color: Colors.black,
              //     )),
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
              TextField(
                controller: usernamecontroler,
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
                controller: repwdcontroler,
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
                controller: contactcontroler,
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
                controller: idcontroler,
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
                      //String Id = randomAlphaNumeric(10);
                      User? currentUser = FirebaseAuth.instance.currentUser;
                      Map<String, dynamic> userInfoMap = {
                        "Id": currentUser!.uid,
                        "Username": usernamecontroler.text,
                        "Password": pwdcontroler.text,
                        "Re-Password": repwdcontroler.text,
                        "Email": emailcontroler.text,
                        "Contact": contactcontroler.text,
                        "ID": idcontroler.text
                      };
                      await DatabaseMethods()
                          .addUserDetials(userInfoMap, currentUser.uid)
                          .then(
                            (value) => {
                              Fluttertoast.showToast(
                                  msg: "Sign UP Successfully",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor:
                                      const Color.fromRGBO(3, 2, 64, 1.000),
                                  textColor: Colors.white,
                                  fontSize: 16.0)
                            },
                          );
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
            ],
          ),
        ),
      )),
    );
  }
}
