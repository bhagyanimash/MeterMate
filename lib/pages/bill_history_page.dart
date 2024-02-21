import 'package:flutter/material.dart';
import 'package:metermate/pages/home_page.dart';

class BillHistoryPage extends StatefulWidget {
  const BillHistoryPage({Key? key}) : super(key: key);

  @override
  State<BillHistoryPage> createState() => _BillHistoryPageState();
}

class _BillHistoryPageState extends State<BillHistoryPage> {
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
                "Bill History",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Content
              SizedBox(height: 20.0),

              buildContainer('Month: January', 'Bill Amount: Rs.3580.50'),
              buildContainer('Month: February', 'Bill Amount: Rs.4793.25'),
              buildContainer('Month: March', 'Bill Amount: Rs.2980.50'),
              buildContainer('Month: April', 'Bill Amount: Rs.3429.50'),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContainer(String month, String billAmount) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          // Add your action when this container is tapped
        },
        borderRadius: BorderRadius.circular(15),
        onHover: (hovering) {
          // Handle hover effect here
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              month,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              billAmount,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
