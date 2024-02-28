import 'package:flutter/material.dart';

class MeterScanPage extends StatefulWidget {
  const MeterScanPage({super.key});

  @override
  State<MeterScanPage> createState() => _MeterScanPageState();
}

class _MeterScanPageState extends State<MeterScanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(233, 230, 242, 1.000),
        elevation: 0,
        title: const Text(
          'Scan Meter Board',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            SizedBox(
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
                  "Capture Meter Board",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
    ;
  }
}
