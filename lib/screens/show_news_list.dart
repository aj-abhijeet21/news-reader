import 'package:flutter/material.dart';
import 'package:news_reader/models/article.dart';
import 'package:news_reader/utilities/news_services.dart';
import 'package:news_reader/widgets/article_list.dart';

class ShowNews extends StatelessWidget {
  String newsUrl;
  ShowNews({required this.newsUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: FutureBuilder<List<Article>>(
        future: getNews(newsUrl),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ArticleList(
              articles: snapshot.data!,
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }
        },
      ),
    );
  }
}
