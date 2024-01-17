import 'package:flutter/material.dart';
import 'package:metermate/pages/test_scanner_page.dart';


void main() {
  runApp(const MeterMate());
}

class MeterMate extends StatelessWidget {
  const MeterMate({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TestScannerPage(),
    );
  }
}
