// import 'dart:js';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_cms/card_template/Cardnews_List.dart';
import 'package:flutter_app_cms/card_template/Cardnews_Header.dart';
import 'package:flutter_app_cms/model/Articles.dart';
import 'package:flutter_app_cms/model/NewsModel.dart';
import 'package:flutter_app_cms/services/ServicesApi.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:flutter_app_cms/screen/login/Login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<NewsModel> futureNewsMd;
  NewsModel dataNewsModel;
  static List<ArticlesModel> _list = [];
  final List<String> lstDanhMuc = ['Home'];
  bool _isVisible = true;
  // ServicesAPI _servicesAPI;
  final List<String> items = [
    'Alimentação',
    'Artigos para o lar',
    'Beleza',
    'Carros',
    'Computadores',
    'Consertos',
    'Construção',
    'Ensino',
    'Esporte',
    'Pet',
    'Presentes',
    'Religião',
    'Saúde',
    'Serviços Gráficos',
    'Serviços para o lar',
    'Serviços profissionais',
  ];
  void onToggle(BuildContext context) {
    if (ServicesAPI.userModel.name == "")
      Navigator.pushNamed(context, '/login');
    else
      setState(() {
        ServicesAPI.userModel.name = "";
      });
  }

  void getData() async {
    // //th1
    // Response response = await get(ServicesAPI.BASE_URL);
    // dataNewsModel = NewsModel.fromJson(json.decode(response.body));

    // NewsModel newsModel = await NewsRepository().getItem();
    // if (newsModel != null) {
    //   for (var item in newsModel.list) {
    //     setState(() {
    //       _list.add(item);

    //       print(item.author);
    //     });
    //   }
    // } else {
    //   print(' cho nay co loi');
    // }
  }

  someFunc() async {
    // _list.forEach((element) {
    //   if (lstDanhMuc.length != 1) {
    //     lstDanhMuc.forEach((element2) {
    //       if (element.source.name != element2) {
    //         setState(() {
    //           lstDanhMuc.add(element.source.name);
    //           print('ten add' + element.source.name);
    //         });
    //       }
    //     });
    //   }
    //   if (lstDanhMuc.length == 1) {
    //     setState(() {
    //       lstDanhMuc.add(element.source.name);
    //     });
    //   }
    // });
  }

  @override
  void initState() {
    super.initState();
    // getData();
    futureNewsMd = ServicesAPI.getNewsModeldata();

    // futureNewsMd.
    // futureNewsMd.then((value) => (() {
    //       _HomePageState._list = value.list;
    //       print('length ' + _HomePageState._list.length.toString());
    //       someFunc();
    //     }()));
    // _list = dataNewsModel.list;
    // print('length ' + _HomePageState._list.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldkey =
        new GlobalKey<ScaffoldState>();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        // appBar: AppBar(title: ,),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                  color: Colors.grey[300],
                  child: Stack(
                      alignment: AlignmentDirectional.centerStart,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            _scaffoldkey.currentState.openDrawer();
                          },
                          icon: Icon(Icons.menu),
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
              Expanded(
                  child: Column(children: [
                FutureBuilder(
                    future: futureNewsMd,
                    builder: (context, snapshot) {
                      if (snapshot.hasError)
                        return Center(child: Text(snapshot.error.toString()));
                      else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        dataNewsModel = snapshot.data as NewsModel;
                        _list = dataNewsModel.list;
                        someFunc();
                        return new Expanded(
                            child: CustomScrollView(
                          slivers: <Widget>[
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  return CardNewsHeader(
                                    articles: dataNewsModel.list[0],
                                  );
                                },
                                childCount: dataNewsModel == null ? 0 : 1,
                              ),
                            ),
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  return CardNewsListHeader(
                                    articles: dataNewsModel.list[index],
                                  );
                                },
                                childCount: dataNewsModel == null
                                    ? 0
                                    : dataNewsModel.list.length,
                              ),
                            ),
                          ],
                        )

                            // ListView.builder(
                            //     itemCount: _list.length,
                            //     itemBuilder: (BuildContext context, int index) {
                            //       return Text('${_list[index].author}');
                            //       // roi do
                            //       // nghiem cuu them di
                            //     }),
                            );
                      }
                      return CircularProgressIndicator();
                    }),
              ])),
            ],
          ),
        ),
        key: _scaffoldkey,
        drawer: Drawer(
            child: Column(children: [
          Expanded(
              child: Column(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/logo/brave-browser.png"),
                      fit: BoxFit.fitHeight),
                  color: Colors.grey,
                ),
                child: null,
              ),
              Text(
                ServicesAPI.userModel.name == "" ? "ĐĂNG NHẬP" : "Hello"
                // (() {
                //   // return "ĐĂNG NHẬP";
                //   if (ServicesAPI.userModel.name == "")
                //     return "ĐĂNG NHẬP";
                //   else
                //     return ServicesAPI.userModel.name;
                //   // setState(() {});
                // }()),
                ,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 30,
              ),
              Visibility(
                visible: ServicesAPI.userModel.name == "" ? false : true,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/stprofile');
                  },
                  child: Text(
                    'Setup Profile',
                  ),
                ),
              ),
              ExpansionTile(
                title: new Text(
                  'Bản Đồ',
                  style: new TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.blue),
                ),
                children: <Widget>[
                  new Column(
                    children: [
                      ListTile(
                          title: new Text(
                            'Bản Đồ Google Map',
                            style: new TextStyle(
                                fontSize: 18.0, color: Colors.lightBlue),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, '/mapgoogle');
                          }),
                      ListTile(
                          title: new Text(
                            'Bản Đồ Gis Hcm',
                            style: new TextStyle(
                                fontSize: 18.0, color: Colors.lightBlue),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, '/mapgishcm');
                          }),
                      ListTile(
                          title: new Text(
                            'List Bản Đồ ',
                            style: new TextStyle(
                                fontSize: 18.0, color: Colors.lightBlue),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, '/maplist');
                          }),
                      // ListTile(
                      //     title: new Text(
                      //       'Bản Đồ ',
                      //       style: new TextStyle(
                      //           fontSize: 18.0, color: Colors.lightBlue),
                      //     ),
                      //     onTap: () {
                      //       Navigator.pushNamed(context, '/mappage');
                      //     }),
                      ListTile(
                          title: new Text(
                            'Bản Đồ Test Web',
                            style: new TextStyle(
                                fontSize: 18.0, color: Colors.lightBlue),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, '/maptest');
                          }),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('DANH MỤC'),
                  SizedBox(
                    width: 50,
                  ),
                  GestureDetector(
                    onTap: () => (() {
                      onToggle(context);
                    }()),
                    child: Text(
                      (ServicesAPI.userModel.name == "")
                          ? "ĐĂNG NHẬP"
                          : "ĐĂNG XUẤT"
                      // setState(() {
                      //   if (ServicesAPI.userModel.name == null)
                      //     return "ĐĂNG NHẬP";
                      //   else
                      //     return "ĐĂNG XUẤT";
                      // })
                      // (() {
                      //   // if (ServicesAPI.userModel.name == null)
                      //   //   return "ĐĂNG NHẬP";
                      //   // else
                      //   //   return "ĐĂNG XUẤT";
                      //   setState(() {
                      //     if (ServicesAPI.userModel.name == null)
                      //       return "ĐĂNG NHẬP";
                      //     else
                      //       return "ĐĂNG XUẤT";
                      //   });
                      // }())
                      ,
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              ),
              FutureBuilder(
                  future: futureNewsMd,
                  builder: (context, snapshot) {
                    if (snapshot.hasError)
                      return Center(child: Text(snapshot.error.toString()));
                    else if (snapshot.connectionState == ConnectionState.done) {
                      dataNewsModel = snapshot.data as NewsModel;
                      return new Expanded(
                        child: ListView.builder(
                            itemCount: lstDanhMuc.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                title: Text('${lstDanhMuc[index]}'),
                                onTap: () {
                                  // Update the state of the app.
                                  // ...
                                  // Then close the drawer.
                                },
                              );
                              // roi do
                              // nghiem cuu them di
                            }),
                      );
                      // ListView.builder(
                      //     itemCount: _list.length,
                      //     itemBuilder: (BuildContext context, int index) {
                      //       return Text('${_list[index].author}');
                      //       // roi do
                      //       // nghiem cuu them di
                      //     }),

                    }
                    return CircularProgressIndicator();
                  }),
            ],
          )),
        ])));
  }
}
