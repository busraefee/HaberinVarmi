import 'package:flutter/material.dart';

import '../data/news_service.dart';
import '../model/category.dart';
import '../widgets/authors_widget.dart';
import '../widgets/catlist_widget.dart';
import '../widgets/firstfour_gridwidget.dart';
import '../widgets/horizontal_news.dart';
import '../widgets/last_cards_widget.dart';
import '../widgets/slider_widget.dart';
import 'category_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NewsService _newsService = NewsService();
  List<Category> _categoryModel;
  bool isLoading = false;

  Future<void> init() async {
    _categoryModel = await _newsService.getCategory();
    changeLoading();
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbarHome(),
        drawer: drawerHome(),
        body: Center(
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              children: [
                SliderWidget(),
                CatlistWidget(),
                FirstfourGridwigdet(),
                HorizontalNews(),
                AuthorsWigdet(),
                LastCardsWidget(),
              ],
            ),
          ),
        ));
  }

  AppBar appbarHome() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 55.0),
            child: Text(
              'Haberin Var Mı?',
            ),
          ),
          Icon(
            Icons.search,
            color: Colors.white,
          ),
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      centerTitle: true,
    );
  }

  Drawer drawerHome() {
    return Drawer(
      child: isLoading
          ? ListView.builder(
              itemCount: _categoryModel.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_categoryModel[index].catName.toUpperCase()),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryScreen(
                            categoryId: _categoryModel[index].catId,
                            categoryName:
                                _categoryModel[index].catName.toUpperCase()),
                      ),
                    );
                  },
                );
              },
            )
          : const SizedBox(
              height: 10, child: Center(child: CircularProgressIndicator())),
    );
  }
}
