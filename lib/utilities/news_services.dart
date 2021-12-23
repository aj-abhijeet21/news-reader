import 'dart:convert';

import 'package:news_reader/models/article.dart';
import 'package:http/http.dart' as http;

Future<List<Article>> getHeadlines() async {
  var headlinesUrl = Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=in&apiKey=d51719fb15d04debb85f08e17860bf06');

  var response = await http.get(headlinesUrl);

  if (response.statusCode == 200) {
    Map jsonData = json.decode(response.body);
    if (jsonData['status'] == 'ok') {
      var articles = jsonData['articles'] as List;
      List<Article> articleList = <Article>[];
      articleList =
          articles.map((element) => Article.fromJson(element)).toList();
      return articleList;
    }
    // print(data['articles']);
  }
  throw Exception('Unable to fetch news');
}

Future<List<Article>> getNews(url) async {
  var newsUrl = Uri.parse(url);

  var response = await http.get(newsUrl);

  if (response.statusCode == 200) {
    Map jsonData = json.decode(response.body);
    if (jsonData['status'] == 'ok') {
      var articles = jsonData['articles'] as List;
      List<Article> articleList = <Article>[];
      articleList =
          articles.map((element) => Article.fromJson(element)).toList();
      return articleList;
    }
    // print(data['articles']);
  }
  throw Exception('Unable to fetch news');
}
