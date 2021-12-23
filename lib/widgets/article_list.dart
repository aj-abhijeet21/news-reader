import 'package:flutter/material.dart';
import 'package:news_reader/models/article.dart';
import 'package:news_reader/widgets/news_tile.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleList extends StatelessWidget {
  final List<Article> articles;

  void newsClick(Article article) async {
    var url = article.url;
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: true, forceWebView: true);
    }
  }

  ArticleList({required this.articles});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(8.0),
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: NewsTile(
                article: articles[index],
              ),
              onTap: () => newsClick(articles[index]),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 5.0,
            );
          }),
    );
  }
}
