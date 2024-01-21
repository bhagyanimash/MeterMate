import 'package:flutter/material.dart';

class QRscanPage extends StatefulWidget {
  const QRscanPage({super.key});

  @override
  State<QRscanPage> createState() => _QRscanPageState();
}

class _QRscanPageState extends State<QRscanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(3, 2, 64, 1.000),
        elevation: 0,
        title: const Text(
          'Scan Meter QR',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: SizedBox(
          height: 50,
          width: 350,
          child: RawMaterialButton(
            fillColor: const Color.fromRGBO(3, 2, 64, 1.000),
            //elevation: 0.0,
            //padding: EdgeInsets.symmetric(),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {},
            child: const Text(
              "Scan Meter Board",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
