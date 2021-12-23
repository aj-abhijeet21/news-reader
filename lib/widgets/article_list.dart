import 'package:flutter/material.dart';
import 'package:news_reader/models/article.dart';
import 'package:news_reader/utilities/news_services.dart';
import 'package:news_reader/widgets/news_tile.dart';

class ArticleList extends StatelessWidget {
  final List<Article> articles;

  ArticleList({required this.articles});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(8.0),
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: NewsTile(
                article: articles[index],
              ),
              onTap: () => showModal(context, articles[index]),
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
