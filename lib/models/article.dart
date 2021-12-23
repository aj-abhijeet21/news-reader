class Article {
  late String author;
  late String title;
  late String description;
  late String url;
  late String imageUrl;
  late String content;
  late String date;

  Article.fromJson(Map json) {
    author = json['author'] ?? 'Anonymous';
    title = json['title'];
    description = json['description'] ?? 'Description not found';
    imageUrl = json['urlToImage'] ?? 'assets/images/no-image-available.jpg';
    url = json['url'];
    content = json['content'] ?? 'Not available';
    date = json['publishedAt'];
  }
}
