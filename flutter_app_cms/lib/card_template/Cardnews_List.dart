import 'package:flutter/cupertino.dart';
import 'package:flutter_app_cms/model/Articles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_cms/screen/details/Details.dart';

class CardNewsListHeader extends StatefulWidget {
  final ArticlesModel articles;

  CardNewsListHeader({this.articles});

  @override
  _CardNewsListHeaderState createState() => _CardNewsListHeaderState();
}

class _CardNewsListHeaderState extends State<CardNewsListHeader> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsPage(articles: widget.articles),
            ),
          );
          Navigator.pushNamed(context, '/details');
        },
        child: new Card(
            child: Row(
          children: <Widget>[
            Expanded(
                child: Container(
                    margin: EdgeInsets.all(10),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          widget.articles.urlToImage,
                          fit: BoxFit.cover,
                          height: 150,
                          width: 50,
                        )
                        // Image.asset(
                        //   'assets/hinhofbao.jpg',
                        //   fit: BoxFit.cover,
                        //   height: 150,
                        //   width: 50,
                        // ),
                        ))),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
              children: <Widget>[
                Text(
                  widget.articles.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  maxLines: 2,
                ),
                Text(
                  widget.articles.content,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  maxLines: 3,
                )
              ],
            ))
          ],
        )));
  }
}
