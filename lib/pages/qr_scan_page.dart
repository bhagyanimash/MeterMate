import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QRscanPage extends StatefulWidget {
  const QRscanPage({super.key});

  @override
  State<QRscanPage> createState() => _QRscanPageState();
}

class _QRscanPageState extends State<QRscanPage> {
  String qrResult = "Scan Your Meter Board QR";
  bool isVerified = false;

  Future<void> scanQR() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      if (!mounted) return;

      final userUID = FirebaseAuth.instance.currentUser?.uid ?? "";

      setState(() {
        qrResult = qrCode;
        isVerified = qrCode == userUID;
      });

      // Immediately show verification status after scanning
      _showVerificationDialog(context, isVerified);
    } on PlatformException {
      qrResult = 'Failed to read QR Code';
      // Optionally, you can also show a dialog here if the scan fails.
      _showVerificationDialog(context, false);
    }
  }

  void _showVerificationDialog(BuildContext context, bool isVerified) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isVerified ? "Verification" : "Error"),
          content: Text(isVerified ? "Verified User" : "User not found"),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(233, 230, 242, 1.000),
        elevation: 0,
        title: const Text(
          "Scan Meter QR",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(3, 2, 64, 1.000)),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(
            //   '$qrResult',
            //   style: const TextStyle(color: Colors.black),
            // ),

            Center(
              child: Image.asset(
                'images/qr.png',
                width: 250,
              ),
            ),
            const SizedBox(
              height: 80,
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
                onPressed: scanQR,
                child: const Text(
                  "Scan QR",
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
            if (isVerified) // This line checks if isVerified is true
              SizedBox(
                height: 50,
                width: 350,
                child: RawMaterialButton(
                  fillColor: const Color.fromRGBO(233, 230, 242, 1.000),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () {
                    // Adjust the onPressed event as necessary
                    Navigator.pushNamed(context,
                        "meterScanPage"); // Use your actual next page route
                  },
                  child: const Text(
                    "Next",
                    style: TextStyle(
                      color: Color.fromRGBO(3, 2, 64, 1.000),
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
