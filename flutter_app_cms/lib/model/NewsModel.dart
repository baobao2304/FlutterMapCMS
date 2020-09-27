import 'dart:convert';

import 'package:flutter_app_cms/model/Articles.dart';

class NewsModel {
  final String status;
  final int totalResults;
  final List<ArticlesModel> list;

  NewsModel({this.status, this.totalResults, this.list});

  NewsModel.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        totalResults = json['totalResults'],
        list = (json['articles'] as List)
            .map((e) => ArticlesModel.fromJson(e))
            .toList();
}
