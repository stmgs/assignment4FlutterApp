class ArticleModel {
  String author, articleImageUrl, articleTitle, articleDesc, content;

  ArticleModel({
    required this.author,
    required this.articleDesc,
    required this.articleImageUrl,
    required this.articleTitle,
    required this.content,
  });

  // factory ArticleModel.fromJson(Map<String, dynamic> json) {
  //   return ArticleModel(
  //     author: json['author'] as String,
  //     articleTitle: json['title'] as String,
  //     articleDesc: json['description'] as String,
  //     articleImageUrl: json['urlToImage'] as String,
  //     content: json['content'] as String,
  //   );
  // }
}
