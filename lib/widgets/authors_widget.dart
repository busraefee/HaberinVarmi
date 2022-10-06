import 'package:flutter/material.dart';
import 'package:flutter_news/model/all_author.dart';

import '../data/news_service.dart';

class AuthorsWigdet extends StatefulWidget {
  @override
  _AuthorsWigdetState createState() => _AuthorsWigdetState();
}

class _AuthorsWigdetState extends State<AuthorsWigdet> {
  NewsService _newsService = NewsService();
  List<AllAuthor> _allAuthorModel;
  bool isLoading = false;

  Future<void> init() async {
    _allAuthorModel = await _newsService.getAllAuthor();
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
            height: MediaQuery.of(context).size.height / 4,
            child: ListView.builder(
              itemCount: _allAuthorModel.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => SizedBox(
                child: Card(
                    child: Column(
                  children: [
                    Expanded(
                      flex: 9,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            _allAuthorModel[index].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          _allAuthorModel[index].authorName,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                  ],
                )),
              ),
            ),
          )
        : SizedBox(
            child: CircularProgressIndicator(),
          );
  }
}
