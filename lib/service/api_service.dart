import 'dart:convert';

import 'package:e_news/model/news_model.dart';
import 'package:http/http.dart';

class ApiService {
  final allNewsApi =
      "https://newsapi.org/v2/everything?q=*&apiKey=30706a181ada47f38483582ef05b2c93";
  final breakingNewsApi =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=30706a181ada47f38483582ef05b2c93";

  Future<List<NewsModel>> getAllNews() async {
    try {
      Response response = await get(Uri.parse(allNewsApi));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<NewsModel> articlesList =
            body.map((e) => NewsModel.fromJson(e)).toList();
        return articlesList;
      } else {
        throw "No news found";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<NewsModel>> getBreakingNews() async {
    try {
      Response response = await get(Uri.parse(breakingNewsApi));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<NewsModel> articlesList =
            body.map((e) => NewsModel.fromJson(e)).toList();
        return articlesList;
      } else {
        throw "No news found";
      }
    } catch (e) {
      rethrow;
    }
  }
}
