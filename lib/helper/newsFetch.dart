import 'dart:convert';
import 'package:assignment4/models/ArticleModel.dart';
import 'package:http/http.dart' as http;

class NewsFetch {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String baseUrl =
        "https://newsapi.org/v2/top-headlines?country=us&category=general&apiKey=08b403e85fe94d2d9d3418504f1d1803";
    var url = Uri.parse(baseUrl);
    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null
            && element['description'] != null
            && element['author'] != null
            && element['author'] != null
        ) {
          ArticleModel article = ArticleModel(
            author: element['author'],
            articleDesc: element['description'],
            articleImageUrl: element['urlToImage'],
            articleTitle: element['title'],
            content: element['content'],
          );
          news.add(article);
        }
      });
    }
  }
}