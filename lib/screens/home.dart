import 'package:flutter/material.dart';
import 'package:news_reader/screens/search_news.dart';
import 'package:news_reader/screens/show_news_list.dart';
import 'package:news_reader/utilities/apikey.dart';
import 'package:news_reader/utilities/constants.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'News Reader',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.teal[300]),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              await showSearch(context: context, delegate: SearchNews());
            },
          ),
        ],
        bottom: const TabBar(
          isScrollable: true,
          labelColor: Colors.white,
          labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          unselectedLabelColor: Colors.white70,
          unselectedLabelStyle:
              TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
          tabs: [
            Tab(
              text: 'Headlines',
            ),
            Tab(
              text: 'Business',
            ),
            Tab(
              text: 'Tech',
            ),
            Tab(
              text: 'Entertainment',
            ),
            Tab(
              text: 'Sports',
            ),
          ],
        ),
      ),
      body: TabBarView(
        children: [
          ShowNews(
            newsUrl:
                'https://newsapi.org/v2/top-headlines?country=in&apiKey=$APIKEY',
          ),
          ShowNews(
            newsUrl:
                'https://newsapi.org/v2/top-headlines?country=in&category=business&sortBy=popularity&apiKey=$APIKEY',
          ),
          ShowNews(
            newsUrl:
                'https://newsapi.org/v2/top-headlines?country=in&category=technology&sortBy=popularity&apiKey=$APIKEY',
          ),
          ShowNews(
            newsUrl:
                'https://newsapi.org/v2/top-headlines?country=in&category=entertainment&sortBy=popularity&apiKey=$APIKEY',
          ),
          ShowNews(
            newsUrl:
                'https://newsapi.org/v2/top-headlines?country=in&category=sports&sortBy=popularity&apiKey=$APIKEY',
          ),
        ],
      ),
    );
  }
}
