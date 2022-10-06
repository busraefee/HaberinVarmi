import 'package:flutter/material.dart';
import 'package:flutter_news/data/news_service.dart';
import 'package:flutter_news/model/headline.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../screens/news_detail.dart';

class SliderWidget extends StatefulWidget {
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  NewsService _newsService = NewsService();
  List<Headline> _headlineModel;
  bool isLoading = false;

  Future<void> init() async {
    _headlineModel = await _newsService.getHeadline();
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
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            child: Swiper(
              onTap: (index) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      NewsDetail(true, _headlineModel[index].postId),
                ),
              ),
              autoplay: true,
              itemCount: _headlineModel.length,
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      _headlineModel[index].image,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
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
                              height: 80,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: FractionallySizedBox(
                        widthFactor: 0.9,
                        heightFactor: 0.3,
                        child: Text(
                          _headlineModel[index].title,
                          style: Theme.of(context).textTheme.headline5.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w500),
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
          )
        : const SizedBox(
            height: 20, child: Center(child: CircularProgressIndicator()));
  }
}
