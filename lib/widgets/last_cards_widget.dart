import 'package:flutter/material.dart';
import 'package:flutter_news/model/home_second_module.dart';
import 'package:flutter_news/screens/news_detail.dart';
import '../data/news_service.dart';

class LastCardsWidget extends StatefulWidget {
  LastCardsWidget({Key key}) : super(key: key);

  @override
  State<LastCardsWidget> createState() => _LastCardsWidgetState();
}

class _LastCardsWidgetState extends State<LastCardsWidget> {
  //homeSecondModule
  NewsService _newsService = NewsService();
  List<HomeSecond> _homeSecondModel;
  bool isLoading = false;

  Future<void> init() async {
    _homeSecondModel = await _newsService.getHomeSecond();
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
        ? ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  shadowColor: Colors.black87,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width / 30),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: SizedBox(
                            height: 250,
                            child: Image.network(
                              _homeSecondModel[index].image,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width / 50),
                        child: Text(
                          _homeSecondModel[index].title ?? '',
                          maxLines: 2,
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewsDetail(
                                    true, _homeSecondModel[index].postId),
                              ),
                            );
                          },
                          child: Text(
                            "HABERE GİT",
                            style: Theme.of(context).textTheme.button.copyWith(
                                color: Colors.teal,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ),
              );
            })
        : SizedBox(
            height: 20,
            child: Center(child: CircularProgressIndicator()),
          );
  }
}
