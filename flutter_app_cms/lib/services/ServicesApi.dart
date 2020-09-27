import 'dart:convert';

// import 'package:dio/dio.dart';
import 'package:flutter_app_cms/model/NewsModel.dart';
import 'package:flutter_app_cms/model/User.dart';
import 'package:http/http.dart';

class ServicesAPI {
  // final dio = Dio();
  // final NewsModel newsModel111 = null;
  static List<UserModel> lstUser = [
    UserModel(
        mk: '123456',
        tk: 'bao',
        email: 'lebao@gmail.com',
        name: 'Bảo Phạm',
        numberphone: '0915312132')
  ];
  static UserModel userModel = new UserModel();
  static String BASE_URL =
      "https://newsapi.org/v2/everything?q=bitcoin&apiKey=adfceebfc6a44ac59e5bc13dbc50a73b";

  // static Future getNewsApi() => http.get(BASE_URL);

  // Future<NewsModel> getData() async {
  //   try {
  //     Response response = await dio.get(BASE_URL);

  //     return NewsModel.fromJson(response.data);
  //   } catch (error) {
  //     return error;
  //   }
  // }

  static Future<NewsModel> getNewsModeldata() async {
    Response res = await get(BASE_URL);

    if (res.statusCode == 200) {
      return NewsModel.fromJson(json.decode(res.body));
    } else {
      throw "Failed to load cases list";
    }
  }
}
