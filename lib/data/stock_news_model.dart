import 'dart:convert';

List<News> newsFromJson(String str) {
  final jsonData = json.decode(str);
  final articles = jsonData['articles'];

  return List<News>.from(articles.map((x) => News.fromJson(x)));
}

String newsToJson(List<News> data) {
  final jsonData = List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode({"articles": jsonData});
}

class News {
  String? title;
  String? desc;
  String? author;
  String? publishedAt;

  News({
    required this.title,
    required this.desc,
    required this.author,
    required this.publishedAt,
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
        title: json["title"],
        desc: json["desc"],
        author: json["author"],
        publishedAt: json["publishedAt"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "desc": desc,
        "author": author,
        "publishedAt": publishedAt,
      };
}
