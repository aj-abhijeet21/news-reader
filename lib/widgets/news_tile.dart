import 'package:flutter/material.dart';
import 'package:news_reader/models/article.dart';

class NewsTile extends StatelessWidget {
  final Article article;
  NewsTile({required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 90,
                width: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.network(
                    article.imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  article.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    // color: Colors.black87),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  article.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 10,
                  ), //color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
