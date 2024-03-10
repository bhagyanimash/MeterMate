import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OutageMapPage extends StatefulWidget {
  const OutageMapPage({Key? key}) : super(key: key);

  @override
  State<OutageMapPage> createState() => _OutageMapPageState();
}

class _OutageMapPageState extends State<OutageMapPage> {
  final CameraPosition _initialLocation =
      const CameraPosition(target: LatLng(7.2906, 80.6337), zoom: 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     title: const Text('Outage Map'),
      //     backgroundColor: const Color.fromRGBO(233, 230, 242, 1.000)),
      body: GoogleMap(
        initialCameraPosition: _initialLocation,
        mapType: MapType.normal,
      ),
    );
  }
}
