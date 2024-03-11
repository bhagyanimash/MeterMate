import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:metermate/pages/calendar_page.dart';
import 'package:metermate/pages/outage_map_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user;
  //late String _userName;
  int _selectedIndex = 0; // Added line: to keep track of the selected index

  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    _pages.addAll([
      SingleChildScrollView(
        // Wrap with SingleChildScrollView for scrollable content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // User email container
            Center(
              child: Container(
                margin: const EdgeInsets.all(20),
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  elevation: 5,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Welcome ! " + user!.email!,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 0,
            ),
            Image.asset(
              'images/home.png',
              width: 400,
              height: 150,
            ),

            GridView.count(
              shrinkWrap:
                  true, // Add this line to make GridView work inside Column
              physics:
                  NeverScrollableScrollPhysics(), // Add this line to disable scrolling inside GridView
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
                // Your Container widgets for Scan, Bill History, Pay Bill, Add Account
                // Same as before, just ensure you have them here in the list
              ],
            ),
          ],
        ),
      ),
      const OutageMapPage(),
      const CalendarPage(),
    ]);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
      //backgroundColor: Colors.white,
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
            onPressed: () {},
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
      body: Center(
        child: _pages.elementAt(_selectedIndex), // Display the selected page
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        elevation: 30,
        selectedIndex: _selectedIndex, // Use the _selectedIndex
        onDestinationSelected:
            _onItemTapped, // Update to use the _onItemTapped handler

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
