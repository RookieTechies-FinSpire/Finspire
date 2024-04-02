import 'package:Finspire/data/stock_news_model.dart';
import 'package:Finspire/network/api_service.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<News>? newsArticle = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    getNewsArticles();
  }

  getNewsArticles() async {
    newsArticle = await ApiService().fetchNews();

    if (newsArticle != null) {
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121139),
      body: Visibility(
        visible: isLoading,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: newsArticle?.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      newsArticle![index].title ?? "NULL",
                      style: const TextStyle(
                        color: Color(0xff121139),
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Text(
                      newsArticle![index].desc ?? "NULL",
                      style: const TextStyle(
                        color: Color(0xff121139),
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Text(
                      newsArticle![index].author ?? "NULL",
                      style: const TextStyle(
                        color: Color(0xff121139),
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Text(
                      newsArticle![index].publishedAt ?? "NULL",
                      style: const TextStyle(
                        color: Color(0xff121139),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
