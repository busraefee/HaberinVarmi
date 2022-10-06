import 'package:flutter/material.dart';
import 'package:flutter_news/data/news_service.dart';
import 'package:flutter_news/model/category.dart';

import '../screens/category_screen.dart';

class CatlistWidget extends StatefulWidget {
  @override
  _CatlistWidgetState createState() => _CatlistWidgetState();
}

class _CatlistWidgetState extends State<CatlistWidget> {
  NewsService _newsService = NewsService();
  List<Category> _categoryModel;
  bool isLoading = false;

  Future<void> init() async {
    _categoryModel = await _newsService.getCategory();
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
        ? Container(
            height: 50,
            color: Theme.of(context).primaryColor,
            child: ListView.builder(
              itemCount: _categoryModel.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.03),
                child: Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryScreen(
                              categoryId: _categoryModel[index].catId,
                              categoryName:
                                  _categoryModel[index].catName.toUpperCase()),
                        ), //Categories(articles[index], true)),//NewsDetail(articles[index], true)),
                      );
                    },
                    child: Text(
                      _categoryModel[index].catName.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        : const SizedBox(
            height: 10, child: Center(child: CircularProgressIndicator()));
  }
}
