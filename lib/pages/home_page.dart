import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(3, 2, 64, 1.000),
        // leading: Row(

        //   children: [

        //     const Padding(padding: EdgeInsets.only(left: 15)),
        //     Image.asset(

        //       'images/onlylogo.png',
        //       width: 40,
        //     ),
        //   ],
        //),
        title: const Text(
          "MeterMate",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            //iconSize: 30,
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
          IconButton(
            //iconSize: 30,
            onPressed: () {
              Navigator.pushNamed(context, "userDetails");
            },
            icon: const Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
          ),
          IconButton(
            //iconSize: 30,
            onPressed: () {
              signUserOut();
            },
            icon: const Icon(Icons.logout),
            color: Colors.white,
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(30),
            child: Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 5,
              child: Container(
                //margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),

                child: Text(
                  "Logged IN as : " + user!.email!,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    //fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(40.0),
          //   child: Material(
          //     elevation: 5,
          //     child: Container(
          //       decoration:
          //           BoxDecoration(borderRadius: BorderRadius.circular(10)),
          //       color: Colors.white,
          //       height: 200,
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 250),
            child: GridView.count(
              padding: const EdgeInsets.all(30),
              crossAxisCount: 2,
              children: [
                Column(
                  children: [
                    IconButton(
                      iconSize: 80,
                      onPressed: () {
                        Navigator.pushNamed(context, "scanPage");
                      },
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
