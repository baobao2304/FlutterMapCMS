import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class GisHcm extends StatefulWidget {
  @override
  _GisHcmState createState() => _GisHcmState();
}

class _GisHcmState extends State<GisHcm> {
  void showDialog(BuildContext context) {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 300,
            child: SizedBox.expand(
                child: Column(
              children: [
                Expanded(
                  child: Text(
                    'Chùa Giác Hoằng ',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                    child: Image.network(
                        'https://vuonhoaphatgiao.com/uploads/noidung/images/phat_hoc/chua-viet-nam.jpg')),
              ],
            )),
            margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var markers = <Marker>[
      Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(10.7831563, 106.6443357),
        builder: (ctx) => Container(
            child: GestureDetector(
          onTap: () {
            showDialog(context);
          },
          child: Row(children: [
            Icon(
              Icons.room,
              color: Colors.red,
            ),
            Expanded(child: Text('Chùa Giác Hoằng'))
          ]),
        )),
      ),
    ];
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
          FlutterMap(
            options: MapOptions(
              center: LatLng(10.800218, 106.662294),
              zoom: 9.0,
            ),
            layers: [
              TileLayerOptions(
                // 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                // https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}
                wmsOptions: WMSTileLayerOptions(
                    baseUrl: 'https://maps.hcmgis.vn/geoserver/gwc/service/wms',
                    layers: ['hcm_map:hcm_map_all']),

                tileProvider: NonCachingNetworkTileProvider(),
              ),
              MarkerLayerOptions(markers: markers)
            ],
          )
          // Container(
          //   alignment: Alignment.bottomCenter,
          // )
        ],
      ))
    ]));
  }
}
