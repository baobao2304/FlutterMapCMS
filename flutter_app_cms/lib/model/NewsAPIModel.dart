// import 'package:json_annotation/json_annotation.dart';

// import 'Articles.dart';

// @JsonSerializable()
// class NewsAPI {
//   String _status;
//   int _totalResults;
//   List<Articles> _articles;

//   NewsAPI({String status, int totalResults, List<Articles> articles}) {
//     this._status = status;
//     this._totalResults = totalResults;
//     this._articles = articles;
//   }

//   String get status => _status;
//   set status(String status) => _status = status;
//   int get totalResults => _totalResults;
//   set totalResults(int totalResults) => _totalResults = totalResults;
//   List<Articles> get articles => _articles;
//   set articles(List<Articles> articles) => _articles = articles;

//   NewsAPI.fromJson(Map<String, dynamic> json) {
//     _status = json['status'];
//     _totalResults = json['totalResults'];
//     if (json['articles'] != null) {
//       _articles = new List<Articles>();
//       json['articles'].forEach((v) {
//         _articles.add(new Articles.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this._status;
//     data['totalResults'] = this._totalResults;
//     if (this._articles != null) {
//       data['articles'] = this._articles.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
