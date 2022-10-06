import 'package:flutter/material.dart';
import 'package:flutter_news/data/news_service.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../model/detail.dart';
import '../widgets/html_view.dart';

class NewsDetail extends StatefulWidget {
  const NewsDetail(this.source, @required this.postId) : super();
  final String postId;
  final bool source;

  @override
  State<NewsDetail> createState() => _NewsDetailState(
        postId: postId,
      );
}

class _NewsDetailState extends State<NewsDetail> {
  _NewsDetailState({
    @required this.postId,
  });

  String postId;
  NewsService _newsService = NewsService();
  List<Detail> _detailModel;
  bool isLoading = false;

  Future<void> init() async {
    _detailModel = await _newsService.getDetail(postId);
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
    initializeDateFormatting('az');
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black87),
          title: Text(
            "Haber Detayı",
            style: TextStyle(color: Colors.black87),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: isLoading
            ? SafeArea(
                child: _content(context),
              )
            : const SizedBox(
                height: 10, child: Center(child: CircularProgressIndicator())));
  }

  Widget _content(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12),
        Expanded(
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  _description(context),
                  SizedBox(height: 12),
                  _body(context),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _description(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 27),
          child: Text(
              !widget.source
                  ? _detailModel.first.title
                      .substring(0, _detailModel.first.title.indexOf(' - '))
                  : _detailModel.first.title,
              style: Theme.of(context).textTheme.headline4),
        ),
        _detailModel.first.image != null ? SizedBox(height: 12) : Container(),
        Image.network(
          _detailModel.first.image,
          width: double.infinity,
        ),
        SizedBox(height: 7),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            children: [
              /* Text(formatterDate(_detailModel.first.date),
                  style: Theme.of(context).textTheme.bodyText1)*/
            ],
          ),
        ),
      ],
    );
  }

  String formatterDate(DateTime date) {
    return DateFormat('dd MMM yyyy').format(date);
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 27),
      child: HtmlView(htmlData: _detailModel.first.content),
    );
  }
}
