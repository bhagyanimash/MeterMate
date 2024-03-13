import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQRpage extends StatefulWidget {
  const GenerateQRpage({super.key});

  @override
  State<GenerateQRpage> createState() => _GenerateQRpageState();
}

class _GenerateQRpageState extends State<GenerateQRpage> {
  TextEditingController urlControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Generate QR Code")),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (urlControler.text.isNotEmpty)
                QrImageView(
                  data: urlControler.text,
                  size: 200,
                ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  controller: urlControler,
                  decoration: InputDecoration(
                      hintText: "Enter your data",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Enter your data"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: const Text("Generate QR Code"),
              )
            ],
          ),
        ),
      ),
    );
  }
}