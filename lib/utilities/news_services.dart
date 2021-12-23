import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_reader/models/article.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

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

void newsClick(Article article) async {
  var url = article.url;
  if (await canLaunch(url)) {
    await launch(url, forceSafariVC: true, forceWebView: true);
  }
}

Future showModal(BuildContext context, Article article) {
  DateTime date = DateTime.parse(article.date);
  final DateFormat formatter = DateFormat('dd-MMMM-yyyy');
  final String formattedDate = formatter.format(date);

  return showModalBottomSheet<dynamic>(
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
    ),
    context: context,
    builder: (context) {
      return Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.network(
                        article.imageUrl,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  article.title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formattedDate,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w100,
                          color: Colors.white54),
                    ),
                    Text(
                      'by ${article.author}',
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w100,
                          color: Colors.white54),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  article.description,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () => newsClick(article),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: const Text(
                        'Read full article here',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.teal[300],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
