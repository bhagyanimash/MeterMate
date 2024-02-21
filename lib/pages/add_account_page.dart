import 'dart:io';

import 'package:flutter/material.dart';
import 'package:metermate/pages/home_page.dart';

class AddAccountPage extends StatefulWidget {
  const AddAccountPage({Key? key}) : super(key: key);

  @override
  State<AddAccountPage> createState() => _AddAccountPageState();
}

class _AddAccountPageState extends State<AddAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      iconSize: 30,
                      onPressed: () {
                        Navigator.pushNamed(context, 'homePage');
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 5.0),

              Text(
                "Add Account Details",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 40.0),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        hintText: "Full name",
                        labelText: 'Full Name',
                        prefixIcon: const Icon(
                          Icons.person_outline,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    SizedBox(height: 20.0),

                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        hintText: "Account no",
                        labelText: 'Account Number',
                        prefixIcon: const Icon(
                          Icons.numbers,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    SizedBox(height: 20.0),

                    TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        hintText: "xxxxxxxx",
                        labelText: 'Meter Board ID',
                        prefixIcon: const Icon(
                          Icons.calendar_month,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    SizedBox(height: 20.0),

                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        hintText: "Contact no",
                        labelText: 'Enter Contact Number',
                        prefixIcon: const Icon(
                          Icons.phone,
                          color: Colors.black,
                        ),
                      ),
                    ),


                    SizedBox(height: 20.0),

                    TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        hintText: "NIC",
                        labelText: 'Enter NIC Number',
                        prefixIcon: const Icon(
                          Icons.credit_card,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    SizedBox(height: 20.0),

                    TextField(

                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        hintText: "Upload photo",
                        labelText: 'Add Profile Picture',
                        prefixIcon: const Icon(
                          Icons.image,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    SizedBox(height: 50.0),

                    Center(
                      child: SizedBox(
                        height: 50,
                        width: 500,
                        child: RawMaterialButton(
                          fillColor: const Color.fromRGBO(3, 2, 64, 1.000),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Add Account",
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
            ],
          ),
        ),
      ),
    );
  }
}

