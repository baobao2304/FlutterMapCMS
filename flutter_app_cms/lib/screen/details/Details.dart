import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_cms/model/Articles.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:flutter_html_view/flutter_html_view.dart';

class DetailsPage extends StatefulWidget {
  final ArticlesModel articles;
  DetailsPage({this.articles});
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  // WebViewController webViewController;
  String html =
      '<h1>This is heading 1</h1> <h2>This is heading 2</h2><h3>This is heading 3</h3><h4>This is heading 4</h4><h5>This is heading 5</h5><h6>This is heading 6</h6><p><img alt="Test Image" src="https://i.ytimg.com/vi/RHLknisJ-Sg/maxresdefault.jpg" /></p>';
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? CircularProgressIndicator()
        : Scaffold(
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
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        widget.articles.title == ""
                            ? ''
                            : widget.articles.title,

                        // 'Title of content new Title of content new Title of content new Title of content new Title of content new Title of content new ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        maxLines: 2,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Image.network(
                        widget.articles.urlToImage,
                        fit: BoxFit.cover,
                        height: 300,
                      ),
                      SizedBox(
                        height: 30,
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
                  ),
                )
                // Container(
                //   child: WebView(
                //     initialUrl: '',
                //     javascriptMode: JavascriptMode.unrestricted,
                //     onWebViewCreated: (WebViewController tmp) {
                //       webViewController = tmp;
                //       loadLocalHTML();
                //     },
                //   ),
                // )
              ])));
  }

  // loadLocalHTML() async {
  //   webViewController.loadUrl(Uri.dataFromString(html,
  //           mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
  //       .toString());
  // }
}
