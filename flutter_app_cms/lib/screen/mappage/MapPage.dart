import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MAP'),
      ),
      body: GoogleMap(
          initialCameraPosition: CameraPosition(
        target: LatLng(37.77483, -122.41942),
        zoom: 12,
      )),
    );
  }
}
