import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;
  //late String _userName;
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  // void initState() {
  //   super.initState();
  //   _loadUserName();
  // }

  // Future<void> _loadUserName() async {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if (user != null) {
  //     setState(() {
  //       _userName = user.displayName ?? '';
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    /*User? user = FirebaseAuth.instance.currentUser;
    userName = user?.displayName ?? '';*/
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        toolbarHeight: 80,
        backgroundColor: const Color.fromRGBO(233, 230, 242, 1.000),
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
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Color.fromRGBO(3, 2, 64, 1.000),
          ),
        ),
        actions: [
          IconButton(
            iconSize: 30,
            onPressed: () {
              Navigator.pushNamed(context, 'outageMapPage');
            },
            icon: const Icon(
              Icons.notifications,
              color: Color.fromRGBO(3, 2, 64, 1.000),
            ),
          ),
          IconButton(
            iconSize: 30,
            onPressed: () {
              Navigator.pushNamed(context, "userDetails");
            },
            icon: const Icon(
              Icons.account_circle,
              color: Color.fromRGBO(3, 2, 64, 1.000),
            ),
          ),
          IconButton(
            iconSize: 30,
            onPressed: () {
              signUserOut();
            },
            icon: const Icon(Icons.logout),
            color: Color.fromRGBO(3, 2, 64, 1.000),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(30),
            child: Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 5,
              child: Container(
                //margin: EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),

                child: Text(
                  "Hi ! " + user!.email!,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    //fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 250),
            child: GridView.count(
              padding: const EdgeInsets.all(30),
              crossAxisCount: 2,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: Column(
                      children: [
                        IconButton(
                          iconSize: 80,
                          onPressed: () {
                            Navigator.pushNamed(context, "qrScanPage");
                          },
                          icon: const Icon(
                            Icons.crop_free,
                            color: Color.fromRGBO(3, 2, 64, 1.000),
                          ),
                        ),
                        const Text('Scan')
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: Column(
                      children: [
                        IconButton(
                          iconSize: 80,
                          onPressed: () {
                            Navigator.pushNamed(context, 'billHistoryPage');
                          },
                          icon: const Icon(
                            Icons.assignment,
                            color: Color.fromRGBO(3, 2, 64, 1.000),
                          ),
                        ),
                        const Text('Bill History')
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: Column(
                      children: [
                        IconButton(
                          iconSize: 80,
                          onPressed: () {
                            Navigator.pushNamed(context, 'billPage');
                          },
                          icon: const Icon(
                            Icons.credit_card,
                            color: Color.fromRGBO(3, 2, 64, 1.000),
                          ),
                        ),
                        const Text('Pay Bill')
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: Column(
                      children: [
                        IconButton(
                          iconSize: 80,
                          onPressed: () {
                            Navigator.pushNamed(context, 'addAccountPage');
                          },
                          icon: const Icon(
                            Icons.person_add,
                            color: Color.fromRGBO(3, 2, 64, 1.000),
                          ),
                        ),
                        const Text('Add Account')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        elevation: 30,
        onDestinationSelected: (int index) {
          setState(() {});
        },
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(
              Icons.home,
              color: Color.fromRGBO(3, 2, 64, 1.000),
              size: 30,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.place,
              color: Color.fromRGBO(3, 2, 64, 1.000),
              size: 30,
            ),
            label: 'Outage Map',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.calendar_month,
              color: Color.fromRGBO(3, 2, 64, 1.000),
              size: 30,
            ),
            label: 'Calender',
          ),
        ],
      ),
    );
  }
}
