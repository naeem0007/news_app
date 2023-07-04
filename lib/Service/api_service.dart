import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/Model/news_model.dart';

class ApiService {
  var allNewsurl =
      'https://newsapi.org/v2/everything?q=apple&from=2023-07-02&to=2023-07-02&sortBy=popularity&apiKey=17967ba13fcb47f881fcba918bd82b2a';
  var breakingNews =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=17967ba13fcb47f881fcba918bd82b2a';

  Future<List<NewsModel>> getallNews() async {
    try {
      var client = http.Client();
      var response = await client.get(Uri.parse(allNewsurl));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<NewsModel> articleList =
            body.map((item) => NewsModel.fromJson(item)).toList();
        return articleList;
      } else {
        throw 'No News Found';
      }
    } catch (e) {
      throw 'Nothing Found';
    }
  }

  Future<List<NewsModel>> getBreakingNews() async {
    try {
      var client = http.Client();
      var response = await client.get(Uri.parse(breakingNews));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<NewsModel> articleList =
            body.map((item) => NewsModel.fromJson(item)).toList();
        return articleList;
      } else {
        throw 'No News Found';
      }
    } catch (e) {
      throw 'Nothing Found';
    }
  }
}
