import 'package:flutter/material.dart';
import 'package:flutter_app_cms/model/MapModel.dart';

class CardMapsList extends StatefulWidget {
  final MapModel mapMd;
  CardMapsList({this.mapMd});
  @override
  _CardMapsListState createState() => _CardMapsListState();
}

class _CardMapsListState extends State<CardMapsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Expanded(
          child: Column(
        children: <Widget>[
          Expanded(
              child: Row(
            children: [
              Text(
                widget.mapMd.name,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text('chỉ đường'),
                color: Colors.blueAccent,
              )
            ],
          )),
          SizedBox(
            height: 20,
          ),
          Text(
            widget.mapMd.title,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ],
      )),
    );
  }
}
