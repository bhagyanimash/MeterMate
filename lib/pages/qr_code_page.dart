import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:gallery_saver/gallery_saver.dart';

class QRCodePage extends StatefulWidget {
  final String data;
  const QRCodePage({Key? key, required this.data}) : super(key: key);

  @override
  State<QRCodePage> createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  final GlobalKey _globalKey = GlobalKey();

  Future<void> _saveQRCode() async {
    try {
      RenderRepaintBoundary boundary = _globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      // Getting the temporary directory to save the file, so we can share it later
      final directory = (await getTemporaryDirectory()).path;
      File imgFile = File('$directory/qr_code.png');
      imgFile.writeAsBytesSync(pngBytes);

      // Saving the file to the gallery
      final result =
          await GallerySaver.saveImage(imgFile.path, albumName: 'QR Codes');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(result!
                ? "QR Code saved to gallery"
                : "Failed to save QR Code")),
      );
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to save QR Code")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Download QR",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(3, 2, 64, 1.000)),
        ),
        backgroundColor: const Color.fromRGBO(233, 230, 242, 1.000),
      ),
      body: Center(
        child: RepaintBoundary(
          key: _globalKey,
          child: Container(
            color: Colors.white, // White background
            child: QrImageView(
              data: widget.data,
              version: QrVersions.auto,
              size: 250.0,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveQRCode,
        tooltip: 'Download QR',
        child: const Icon(Icons.download),
      ),
    );
  }
}
