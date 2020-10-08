import 'package:flutter/cupertino.dart';
import 'package:flutter_app_cms/model/Articles.dart';
// import 'package:flutter_app_cms/model/newsmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_cms/screen/details/Details.dart';

class CardNewsHeader extends StatefulWidget {
  final ArticlesModel articles;
  CardNewsHeader({this.articles});

  @override
  _CardNewsHeaderState createState() => _CardNewsHeaderState();
}

class _CardNewsHeaderState extends State<CardNewsHeader> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsPage(
                        articles: widget.articles,
                      )));
        },
        child: new Card(
            margin: EdgeInsets.all(5),
            child: Container(
                margin: EdgeInsets.all(20),
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Image.network(
                      widget.articles.urlToImage,
                      fit: BoxFit.cover,
                      height: 300,
                    ),
                    // Image.asset(
                    //   'assets/hinhofbao.jpg',
                    //   fit: BoxFit.cover,
                    //   height: 300,
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.articles.title,
                      // 'Title of content new Title of content new Title of content new Title of content new Title of content new Title of content new ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.articles.content,
                      // ' content new  of content new  of content new  of content new  of content new  of content new content new  of content new  of content new  of content new  of content new  of content new content new  of content new  of content new  of content new  of content new  of content new content new  of content new  of content new  of content new  of content new  of content new ',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      maxLines: 3,
                    )
                  ],
                ))));
  }
}
