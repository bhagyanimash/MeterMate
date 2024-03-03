import 'package:flutter/material.dart';

class PayNowPage extends StatefulWidget {
  const PayNowPage({Key? key}) : super(key: key);

  @override
  State<PayNowPage> createState() => _PayNowPageState(); // Corrected this line
}

class _PayNowPageState extends State<PayNowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment GateWay"),
        backgroundColor: const Color.fromRGBO(233, 230, 242, 1.000),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        hintText: "Card No",
                        labelText: 'Card Number',
                        prefixIcon: const Icon(
                          Icons.numbers,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        hintText: "Name of the cardholder",
                        labelText: 'Cardholder Name',
                        prefixIcon: const Icon(
                          Icons.person_outline,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextField(
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        hintText: "MM/YY",
                        labelText: 'Expiry Date',
                        prefixIcon: const Icon(
                          Icons.calendar_month,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        hintText: "xxx",
                        labelText: 'CVV',
                        prefixIcon: const Icon(
                          Icons.password,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50.0),
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
            ],
          ),
        ),
      ),
    );
  }
}
