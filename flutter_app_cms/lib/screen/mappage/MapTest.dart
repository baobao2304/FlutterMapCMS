import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:html2md/html2md.dart' as html2md;
import 'package:webview_flutter/webview_flutter.dart';

Future<String> _loadLocalHTML() async {
  return await rootBundle.loadString('assets/html/mapgishcmhtml1.html');
}

class MapTest extends StatelessWidget {
  // @override
  // Widget build(BuildContext context) {
  //   return FutureBuilder<String>(
  //     future: _loadLocalHTML(),
  //     builder: (context, snapshot) {
  //       if (snapshot.hasData) {
  //         return WebviewScaffold(
  //           appBar: AppBar(title: Text("Load HTM file in WebView")),
  //           withJavascript: true,
  //           appCacheEnabled: true,
  //           url: new Uri.dataFromString(snapshot.data, mimeType: 'text/html')
  //               .toString(),
  //         );
  //       } else if (snapshot.hasError) {
  //         return Scaffold(
  //           body: Center(
  //             child: Text("${snapshot.error}"),
  //           ),
  //         );
  //       }
  //       return Scaffold(
  //         body: Center(child: CircularProgressIndicator()),
  //       );
  //     },
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    String html =
        '<h1>This is heading 1</h1> <h2>This is heading 2</h2><h3>This is heading 3</h3><h4>This is heading 4</h4><h5>This is heading 5</h5><h6>This is heading 6</h6><p><img alt="Test Image" src="https://i.ytimg.com/vi/RHLknisJ-Sg/maxresdefault.jpg" /></p>';

    // return new MaterialApp(
    //   home: new Scaffold(
    //     appBar: new AppBar(
    //       title: new Text('Plugin example app'),
    //     ),
    //     body: new SingleChildScrollView(
    //         child: Column(
    //       children: [
    //         // MarkdownBody(data: html2md.convert(html)),
    //         WebviewScaffold(url: 'http://125.234.140.100:3001/ban-do')
    //       ],
    //     )),
    //   ),
    // );https://hcmgis.github.io/service.github.io/
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter WebView example'),
      ),
      body: const WebView(
        initialUrl: 'https://hcmgis.github.io/service.github.io/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
