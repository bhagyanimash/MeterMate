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
        toolbarHeight: 60,
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
            color: Color.fromRGBO(3, 2, 64, 1.000),
          ),
        ),
        actions: [
          IconButton(
            iconSize: 30,
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Color.fromRGBO(3, 2, 64, 1.000),
            ),
          ),
          IconButton(
            iconSize: 30,
            onPressed: () {},
            icon: const Icon(
              Icons.account_circle,
              color: Color.fromRGBO(3, 2, 64, 1.000),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(40.0),
          //   child: Container(
          //     color: Colors.amber,
          //     height: 100,
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: GridView.count(
              padding: const EdgeInsets.all(30),
              crossAxisCount: 2,
              children: [
                Column(
                  children: [
                    IconButton(
                      iconSize: 80,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.crop_free,
                        color: Color.fromRGBO(3, 2, 64, 1.000),
                      ),
                    ),
                    const Text('Scan')
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      iconSize: 80,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.assignment,
                        color: Color.fromRGBO(3, 2, 64, 1.000),
                      ),
                    ),
                    const Text('Bill History')
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      iconSize: 80,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.credit_card,
                        color: Color.fromRGBO(3, 2, 64, 1.000),
                      ),
                    ),
                    const Text('Pay Bill')
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      iconSize: 80,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.person_add,
                        color: Color.fromRGBO(3, 2, 64, 1.000),
                      ),
                    ),
                    const Text('Add Account')
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        elevation: 20,
        onDestinationSelected: (int index) {
          setState(() {});
        },
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(
              Icons.home,
              size: 40,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.place,
              size: 40,
            ),
            label: 'Map',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.calendar_month,
              size: 40,
            ),
            label: 'Calender',
          ),
        ],
      ),
    );
  }
}
