import 'package:flutter/material.dart';

class BillPage extends StatelessWidget {
  const BillPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(233, 230, 242, 1.000),
        title: const Text(
          "Bill Details",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(3, 2, 64, 1.000)),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40.0),
              buildBillContainer('Number of Units Used', '62'),
              buildBillContainer('Charge for the Month', 'Rs. 2542.00'),
              buildBillContainer('Outstanding Amount', 'Rs. 3984.50'),
              const SizedBox(height: 50.0),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 350,
                  child: RawMaterialButton(
                    fillColor: const Color.fromRGBO(3, 2, 64, 1.000),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'payNowPage');
                    },
                    child: const Text(
                      "Pay",
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
    );
  }

  Widget buildBillContainer(String month, String amount) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            month,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            amount,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
