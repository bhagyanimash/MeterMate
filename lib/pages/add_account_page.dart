import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';
import '../services/database.dart';

class AddAccountPage extends StatefulWidget {
  const AddAccountPage({super.key});

  @override
  State<AddAccountPage> createState() => _AddAccountPageState();
}

class _AddAccountPageState extends State<AddAccountPage> {
  TextEditingController nameControler = new TextEditingController();
  TextEditingController accNumberControler = new TextEditingController();
  TextEditingController addressControler = new TextEditingController();
  TextEditingController contactControler = new TextEditingController();
  TextEditingController idControler = new TextEditingController();
  bool dataAdded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(233, 230, 242, 1.000),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
            )),
        title: const Text(
          "Add Account",
          style: TextStyle(
            color: Colors.black,
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
              const SizedBox(
                height: 44.0,
              ),
              const Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  "Full Name",
                  style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(3, 2, 64, 1.000),
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                controller: nameControler,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: "Full Name",
                  // prefixIcon: const Icon(
                  //   Icons.person_outline,
                  //   color: Colors.black,
                  // ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  "Account Number",
                  style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(3, 2, 64, 1.000),
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                controller: accNumberControler,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: "Account Number",
                  // prefixIcon: const Icon(
                  //   Icons.,
                  //   color: Colors.black,
                  // ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  "Address",
                  style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(3, 2, 64, 1.000),
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                controller: addressControler,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: "Address",
                  // prefixIcon: const Icon(
                  //   Icons.dock,
                  //   color: Colors.black,
                  // ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  "NIC Number",
                  style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(3, 2, 64, 1.000),
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                controller: idControler,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: "NIC Number",
                  // prefixIcon: const Icon(
                  //   Icons.dock,
                  //   color: Colors.black,
                  // ),
                ),
              ),
              const SizedBox(
                height: 60.0,
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
                        //"Id": Id,
                        "Full Name": nameControler.text,
                        "Account Number": accNumberControler.text,
                        "Address": addressControler.text,
                        "NIC": idControler.text
                      };
                      await DatabaseMethods()
                          .addUserDetails(userInfoMap, currentUser.uid)
                          //.addUserDetails(userInfoMap, Id)
                          .then(
                            (value) => {
                              Fluttertoast.showToast(
                                  msg: "Successfully Added",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor:
                                      const Color.fromRGBO(3, 2, 64, 1.000),
                                  textColor: Colors.white,
                                  fontSize: 16.0),
                              setState(() {
                                dataAdded = true;
                              })
                            },
                          );
                    },
                    child: const Text(
                      "ADD",
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
              if (dataAdded)
                Center(
                  child: SizedBox(
                    height: 50,
                    width: 500,
                    child: RawMaterialButton(
                      fillColor: const Color.fromRGBO(3, 2, 64, 1.000),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      onPressed: () {
                        Navigator.pushNamed(context, 'qrGeneratorPage');
                      },
                      child: const Text(
                        "Generate QR",
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
