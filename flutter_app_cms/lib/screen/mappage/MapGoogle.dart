import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapGoogle extends StatefulWidget {
  @override
  _MapGoogleState createState() => _MapGoogleState();
}

class _MapGoogleState extends State<MapGoogle> {
  Set<Marker> _markers = HashSet<Marker>();
  //polygon phong tỏa bôi đen các điểm  khu vực vị trí
  Set<Polygon> _polygons = HashSet<Polygon>();
  // polyline phong tỏa và hiển thị viền bao khu vực vị trí đã chọn nhưng bên trong k bôi màu
  Set<Polyline> _polylines = HashSet<Polyline>();
  // circle phong tỏa khu vực hiển thị bôi đen bên trong và có viền vòng tròn bên ngoài khu vực
  Set<Circle> _circles = HashSet<Circle>();
  bool _showMapStyle = false;

  GoogleMapController _mapController;
  BitmapDescriptor _markerIcon;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setMarkerIcon();
    _setPolygons();
    _setPolylines();
    _setCircles();
  }

  void _toggleMapStyle() async {
    String style = await DefaultAssetBundle.of(context)
        .loadString('assets/map_style.json');

    if (_showMapStyle) {
      _mapController.setMapStyle(style);
    } else {
      _mapController.setMapStyle(null);
    }
  }

  void _setMarkerIcon() async {
    _markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(2, 2)), 'assets/hinhofbao.jpg');
  }

  void _setCircles() {
    _circles.add(Circle(
        circleId: CircleId("0"),
        center: LatLng(37.76493, -122.42432),
        radius: 1000,
        fillColor: Color.fromRGBO(102, 51, 153, .5)));
  }

  void _setPolylines() {
    List<LatLng> polylinesLatLongs = List<LatLng>();
    polylinesLatLongs.add(LatLng(37.78493, -122.42932));
    polylinesLatLongs.add(LatLng(37.78693, -122.41942));
    polylinesLatLongs.add(LatLng(37.78923, -122.41542));
    polylinesLatLongs.add(LatLng(37.78923, -122.42582));

    _polylines.add(Polyline(
        polylineId: PolylineId("0"),
        points: polylinesLatLongs,
        width: 1,
        color: Colors.orange));
  }

  void _setPolygons() {
    List<LatLng> polygonsLatLongs = List<LatLng>();
    polygonsLatLongs.add(LatLng(37.78493, -122.42932));
    polygonsLatLongs.add(LatLng(37.78693, -122.41942));
    polygonsLatLongs.add(LatLng(37.78923, -122.41542));
    polygonsLatLongs.add(LatLng(37.78923, -122.42582));

    _polygons.add(Polygon(
        polygonId: PolygonId("0"),
        points: polygonsLatLongs,
        strokeWidth: 1,
        fillColor: Colors.orange));
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId("0"),
          position: LatLng(37.77483, -122.41942),
          infoWindow: InfoWindow(
              title: "San Francsico", snippet: "An Interesting city"),
          icon: _markerIcon));
    });
    // _toggleMapStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
          color: Colors.grey[300],
          child: Stack(
              alignment: AlignmentDirectional.centerStart,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  icon: Icon(Icons.arrow_back),
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logo/brave-browser.png',
                      height: 100.0,
                      width: 100.0,
                    ),
                  ],
                ),
              ])),
      // SizedBox(
      //   height: 10,
      // ),
      Expanded(
          child: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition:
                CameraPosition(target: LatLng(37.77483, -122.41942), zoom: 10),
            // markers: _markers,
            polygons: _polygons,
            polylines: _polylines,
            circles: _circles,
            myLocationEnabled: true,
          ),
          // Container(
          //   alignment: Alignment.bottomCenter,
          // )
        ],
      ))
    ]));
  }
}
