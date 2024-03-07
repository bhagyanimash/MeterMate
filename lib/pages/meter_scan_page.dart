import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class MeterScanPage extends StatefulWidget {
  const MeterScanPage({super.key});

  @override
  State<MeterScanPage> createState() => _MeterScanPageState();
}

class _MeterScanPageState extends State<MeterScanPage> {
  String _text = '';
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      final inputImage = InputImage.fromFilePath(pickedImage.path);
      final textDetector = GoogleMlKit.vision.textRecognizer();
      final RecognizedText recognizedText =
          await textDetector.processImage(inputImage);

      // Initialize an empty buffer to collect numeric text.
      final StringBuffer numericText = StringBuffer();

      // Define a regex pattern to match numbers. This pattern matches whole numbers and decimals.
      final RegExp numPattern = RegExp(r'\b\d+\.?\d*\b');

      for (TextBlock block in recognizedText.blocks) {
        for (TextLine line in block.lines) {
          // For each line, check if it matches the numeric pattern.
          // If it does, append it to the numericText buffer.
          if (numPattern.hasMatch(line.text)) {
            // This extracts and appends all numeric matches within the line.
            final matches = numPattern.allMatches(line.text);
            for (var match in matches) {
              numericText.writeln(match.group(0));
            }
          }
        }
      }

      // Update the state with the extracted numeric text.
      setState(() {
        _text = numericText.toString();
      });

      // Don't forget to close the detector when it's no longer needed.
      textDetector.close();

      // After extracting numbers, you can proceed with uploading the text to Firebase as needed.
    }
  }

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
            if (_text.isNotEmpty) SelectableText(_text),
            SizedBox(
              height: 50,
              width: 350,
              child: RawMaterialButton(
                fillColor: const Color.fromRGBO(3, 2, 64, 1.000),
                //elevation: 0.0,
                //padding: EdgeInsets.symmetric(),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: _pickImage,
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
  }
}
