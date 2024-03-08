import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OutageMapPage extends StatefulWidget {
  const OutageMapPage({Key? key}) : super(key: key);

  @override
  State<OutageMapPage> createState() => _OutageMapPageState();
}

class _OutageMapPageState extends State<OutageMapPage> {
  final CameraPosition _initialLocation = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 14);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Outage Map'),
          backgroundColor: const Color.fromRGBO(233, 230, 242, 1.000)),
      body: GoogleMap(
        initialCameraPosition: _initialLocation,
        mapType: MapType.normal,
      ),
    );
  }
}
