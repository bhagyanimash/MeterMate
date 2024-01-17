import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Row(
            children: [
              const Padding(padding: EdgeInsets.only(left: 15)),
              Image.asset(
                'images/onlylogo.png',
                width: 40,
              ),
            ],
          ),
          title: const Text(
            "MeterMate",
            style: TextStyle(
              color: Color.fromRGBO(
                3,
                2,
                64,
                1.000,
              ),
            ),
          ),
          actions: [
            IconButton(
              iconSize: 30,
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Color.fromRGBO(
                  3,
                  2,
                  64,
                  1.000,
                ),
              ),
            ),
            IconButton(
              iconSize: 30,
              onPressed: () {},
              icon: const Icon(
                Icons.account_circle,
                color: Color.fromRGBO(
                  3,
                  2,
                  64,
                  1.000,
                ),
              ),
            ),
          ]),
    );
  }
}
