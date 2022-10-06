import 'package:flutter/material.dart';

import 'package:flutter_news/data/news_service.dart';
import 'package:flutter_news/model/cat_post.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CategoryScreen extends StatefulWidget {
  final String categoryId;
  final String categoryName;

  const CategoryScreen({
    Key key,
    @required this.categoryId,
    @required this.categoryName,
  }) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState(
        categoryId: categoryId,
        categoryName: categoryName,
      );
}

class _CategoryScreenState extends State<CategoryScreen> {
  _CategoryScreenState({
    @required this.categoryId,
    @required this.categoryName,
  });

  final String categoryId;
  final String categoryName;

  NewsService _newsService = NewsService();
  List<CatPost> _categoryPostModel;
  bool isLoading = false;

  Future<void> init() async {
    _categoryPostModel = await _newsService.getCatPost(categoryId);
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

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
      ),
      body: isLoading
          ? Center(
              child: SingleChildScrollView(
                controller: _scrollController,
                physics: ScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width,
                      child: Swiper(
                        autoplay: true,
                        itemCount: _categoryPostModel.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.network(
                                _categoryPostModel[index].image,
                                fit: BoxFit.cover,
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: FractionallySizedBox(
                                  widthFactor: 0.9,
                                  heightFactor: 0.3,
                                  child: Text(
                                    _categoryPostModel[index].title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                    maxLines: 2,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        control: SwiperControl(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.025),
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: (3 / 4),
                        crossAxisCount: MediaQuery.of(context).orientation ==
                                Orientation.landscape
                            ? 3
                            : 2,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width / 50),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blueGrey[200],
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        MediaQuery.of(context).size.width /
                                            1000),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Image.network(
                                          _categoryPostModel[index].image,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        MediaQuery.of(context).size.width / 50),
                                    child: Text(
                                      _categoryPostModel[index].title ?? '',
                                      // maxLines: 4,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),

                    /* SizedBox(
                  child: Column(
                  children: [
                      Text("KÖŞE YAZARLARIMIZ"),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.35,
                        child: ListView.builder(
                          itemCount: authRes.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width/2,
                                child: Card(
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex: 9,
                                          child: Container(
                                            width: MediaQuery.of(context).size.width,
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Image.network(
                                                authRes[index].image,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text(authRes[index].authorName),),
                                      ],
                                    )),
                              ),
                        ),
                      ),
                  ],
                ),
                ),*/
                  ],
                ),
              ),
            )
          : const SizedBox(
              height: 10, child: Center(child: CircularProgressIndicator())),
    );
  }
}
