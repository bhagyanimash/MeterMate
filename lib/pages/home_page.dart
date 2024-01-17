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
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            Column(
              children: [
                IconButton(
                  iconSize: 100,
                  onPressed: () {},
                  icon: Icon(Icons.crop_free),
                ),
                Text('Scan')
              ],
            ),
            Column(
              children: [
                IconButton(
                  iconSize: 100,
                  onPressed: () {},
                  icon: Icon(Icons.assignment),
                ),
                Text('Bill History')
              ],
            ),
            Column(
              children: [
                IconButton(
                  iconSize: 100,
                  onPressed: () {},
                  icon: Icon(Icons.credit_card),
                ),
                Text('Pay Bill')
              ],
            ),
            Column(
              children: [
                IconButton(
                  iconSize: 100,
                  onPressed: () {},
                  icon: Icon(Icons.person_add),
                ),
                Text('Add Account')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
