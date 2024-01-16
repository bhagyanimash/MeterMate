import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:metermate/pages/loading_page.dart';

void main() {
  runApp(const MeterMate());
}

class MeterMate extends StatelessWidget {
  const MeterMate({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingPage(),
    );
  }
}
