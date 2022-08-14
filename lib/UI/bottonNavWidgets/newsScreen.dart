import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:assignment4/models/ArticleModel.dart';
import 'package:assignment4/helper/newsFetch.dart';


class Dashboard extends StatefulWidget {

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  bool _loading = true;
  List<ArticleModel> articleList = new List.empty(growable: false);

  @override
  void initState() {
    super.initState();
    print('inside news');
    getNews();
  }

  getNews() async {
    NewsFetch newsClass = NewsFetch();
    await newsClass.getNews();
    articleList = newsClass.news;
    print('article list is : $articleList');
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  _loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      )
          : SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              ///TopNews
              Container(
                padding: EdgeInsets.only(top: 16),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: articleList.length,
                    itemBuilder: (context, index) {

                      return BlogTile(
                        newsImageUrl: articleList[index].articleImageUrl,
                        newsTitle: articleList[index].articleTitle,
                        newsDescription: articleList[index].articleDesc,
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

}

class BlogTile extends StatelessWidget {
  final String newsImageUrl, newsTitle, newsDescription;

  BlogTile(
      { required this.newsImageUrl,
          required this.newsTitle,
          required this.newsDescription,
         });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {


      },
      child: Container(
        margin: EdgeInsets.only(
          bottom: 20,

        ),
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(newsImageUrl)),
            SizedBox(
              height: 8,
            ),
            Text(
              newsTitle,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              newsDescription,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}


