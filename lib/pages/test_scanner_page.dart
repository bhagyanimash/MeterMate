import 'package:flutter/material.dart';

class TestScannerPage extends StatefulWidget {
  const TestScannerPage({super.key});

  @override
  State<TestScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<TestScannerPage> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue
      
        ),
        body: Text(""),

      ),
    );
  }
}