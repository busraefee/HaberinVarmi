import 'package:flutter/material.dart';
import 'package:flutter_news/data/news_service.dart';
import 'package:flutter_news/model/home_first_module.dart';

class FirstfourGridwigdet extends StatefulWidget {
  @override
  _FirstfourGridwigdetState createState() => _FirstfourGridwigdetState();
}

class _FirstfourGridwigdetState extends State<FirstfourGridwigdet> {
  NewsService _newsService = NewsService();
  List<HomeFirst> _homeFirstModel;
  bool isLoading = false;

  Future<void> init() async {
    _homeFirstModel = await _newsService.getHomeFirst();
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

  //FITTEDBOX
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? GridView.builder(
            //  padding: EdgeInsets.all(MediaQuery.of(context).size.width/100),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: (3 / 4),
              crossAxisCount:
                  MediaQuery.of(context).orientation == Orientation.landscape
                      ? 4
                      : 2,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width / 50),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 2.2,
                        color: Theme.of(context).primaryColor,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        margin: EdgeInsets.all(3),
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width / 1000),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.network(_homeFirstModel[index].image,
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 3.0,
                        right: 3.0,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity((0.9))
                              ],
                              begin: Alignment.topCenter,
                              stops: [0.1, 1],
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              Text(
                                _homeFirstModel[index].title ?? '',
                                maxLines: 4,
                                overflow: TextOverflow.fade,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "2 saat önce",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        : const SizedBox(
            height: 10, child: Center(child: CircularProgressIndicator()));
  }
}
