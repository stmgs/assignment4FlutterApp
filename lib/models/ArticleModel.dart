class ArticleModel {
  String author, articleImageUrl, articleTitle, articleDesc, content;

  ArticleModel({this.author,
    this.articleDesc,
    this.articleImageUrl,
    this.articleTitle,
    this.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      author: json['author'] as String,
      articleTitle: json['title'] as String,
      articleDesc: json['description'] as String,
      articleImageUrl: json['urlToImage'] as String,
      content: json['content'] as String,
    );
  }
}
