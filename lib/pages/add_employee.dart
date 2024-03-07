import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:random_string/random_string.dart';
import '../services/database.dart';

class AddEmployeePage extends StatefulWidget {
  const AddEmployeePage({super.key});

  @override
  State<AddEmployeePage> createState() => _AddEmployeePageState();
}

class _AddEmployeePageState extends State<AddEmployeePage> {
  TextEditingController nameControler = new TextEditingController();
  TextEditingController accControler = new TextEditingController();
  TextEditingController addressControler = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(233, 230, 242, 1.000),
        title: const Text(
          "Add Employee",
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
                  "Employee Name",
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
                  hintText: "Employee Name",
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
                controller: accControler,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: "Account Number",
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
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () async {
                      String Id = randomAlphaNumeric(10);
                      Map<String, dynamic> employeeInfoMap = {
                        "Id": Id,
                        "Name": nameControler.text,
                        "Account": accControler.text,
                        "Adress": addressControler.text
                      };
                      await DatabaseMethods()
                          .addEmployeeDetails(employeeInfoMap, Id)
                          .then((value) {
                        Fluttertoast.showToast(
                            msg: "Successfully Added",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      });
                    },
                    child: const Text(
                      "Add",
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
            ],
          ),
        ),
      )),
    );
  }
}
