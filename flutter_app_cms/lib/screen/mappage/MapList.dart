import 'package:flutter/material.dart';
import 'package:flutter_app_cms/widget/CardMaps_List.dart';
import 'package:flutter_app_cms/model/MapModel.dart';

class MapListPage extends StatefulWidget {
  @override
  _MapListPageState createState() => _MapListPageState();
}

class _MapListPageState extends State<MapListPage> {
  MapModel dataMapsModel;
  final List<MapModel> lstMap = [
    MapModel(
        name: 'Sailing Tower',
        numberPhone: '013213213',
        title: 'Bến Nghé, Quận 1, Thành Phố Hồ Chí Minh',
        urlWeb: '',
        x: '10.779871',
        y: '106.695786'),
    MapModel(
        name: 'Hồ Con Rùa',
        numberPhone: '013213213',
        title: 'phường 6, Quận 3, Thành phố Hồ Chí Minh',
        urlWeb: '',
        x: '10.782696',
        y: '106.696012'),
    MapModel(
        name: '136 Hai Bà Trưng',
        numberPhone: '013213213',
        title: 'Đa Kao, Quận 1, Thành phố Hồ Chí Minh',
        urlWeb: '',
        x: '10.783992',
        y: '106.696992'),
    MapModel(
        name: 'Tổng Lãnh sự quán Hoa Kỳ',
        numberPhone: '013213213',
        title: '4 Lê Duẩn, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh',
        urlWeb: '',
        x: '10.783008',
        y: '106.700701'),
    MapModel(
        name: 'The Box market',
        numberPhone: '013213213',
        title: '04 Phạm Ngọc Thạch, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh',
        urlWeb: '',
        x: '10.781489',
        y: '106.697787'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
          SizedBox(
            height: 10,
          ),
          // Expanded(
          //     child: ListView.builder(
          //         padding: const EdgeInsets.all(8),
          //         itemCount: lstMap.length,
          //         itemBuilder: (BuildContext context, int index) {
          //           return CardMapsList(mapMd: lstMap[index]);
          //         }))
        ],
      ),
    );
  }
}
