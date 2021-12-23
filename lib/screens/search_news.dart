import 'package:flutter/material.dart';
import 'package:news_reader/screens/show_news_list.dart';
import 'package:news_reader/utilities/apikey.dart';
import 'package:news_reader/utilities/constants.dart';

class SearchNews extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    recentSearches.add(query);
    var url =
        'https://newsapi.org/v2/everything?q=$query&sortBy=publishedAt&language=en&apiKey=$APIKEY';
    return ShowNews(newsUrl: url);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: recentSearches.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: recentSearches.isEmpty
                ? const Text('No searches found')
                : Text(recentSearches[index]),
            trailing: recentSearches.isEmpty
                ? null
                : const Icon(Icons.arrow_forward_ios),
            onTap: () {
              query = recentSearches[index];
            },
          );
        });
  }
}
