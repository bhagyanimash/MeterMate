import 'package:flutter/material.dart';
import 'package:metermate/pages/home_page.dart';

class BillPage extends StatefulWidget {
  const BillPage({Key? key}) : super(key: key);

  @override
  State<BillPage> createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Title "Bill Page" and Back Button in the same line
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      iconSize: 30,
                      onPressed: () {
                        Navigator.pushNamed(context, 'loginPage');
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),

                    SizedBox(height: 5.0),


                    Expanded(
                      child: Center(
                        child: Text(
                          "Bill Page",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),

                const SizedBox(
                  height: 80.0,

                ),

                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: "Unit",
                    labelText: 'Number of units used',
                    prefixIcon: const Icon(
                      Icons.ac_unit,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: "Charge",
                    labelText: 'Charge for the month',
                    prefixIcon: const Icon(
                      Icons.monetization_on,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: "Total Amount",
                    labelText: 'Outstanding amount',
                    prefixIcon: const Icon(
                      Icons.attach_money,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: "Payment",
                    labelText: 'Payment amount',
                    prefixIcon: const Icon(
                      Icons.payment,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100.0,
                ),
                Center(
                  child: SizedBox(
                    height: 50,
                    width: 200,
                    child: RawMaterialButton(
                      fillColor: const Color.fromRGBO(3, 2, 64, 1.000),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Pay Now",
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
        ),
      ),
    );
  }
}
