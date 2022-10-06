import 'package:flutter/material.dart';
import 'package:flutter_news/model/home_last_article.dart';

import '../data/news_service.dart';

class HorizontalNews extends StatefulWidget {
  HorizontalNews({Key key}) : super(key: key);

  @override
  State<HorizontalNews> createState() => _HorizontalNewsState();
}

class _HorizontalNewsState extends State<HorizontalNews> {
  //homelastarticle
  NewsService _newsService = NewsService();
  List<HomeLastArticle> _homeLastArticleModel;
  bool isLoading = false;

  Future<void> init() async {
    _homeLastArticleModel = await _newsService.getHomeLastArticle();
    changeLoading();
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? SizedBox(
            height: 150,
            child: ListView.builder(
              itemCount: _homeLastArticleModel.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width / 1.3,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          child: CircleAvatar(
                              child: Image.network(
                                _homeLastArticleModel[index].image,
                                fit: BoxFit.cover,
                              ),
                              backgroundColor: Theme.of(context)
                                  .primaryColorLight
                                  .withOpacity(.6)),
                        ),
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      flex: 6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _homeLastArticleModel[index].authorName ?? '',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            _homeLastArticleModel[index].title ?? '',
                            maxLines: 3,
                            softWrap: true,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : SizedBox(
            height: 20, child: Center(child: CircularProgressIndicator()));
  }
}
