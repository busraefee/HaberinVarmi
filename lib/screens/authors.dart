import 'package:flutter/material.dart';
import 'package:flutter_news/data/news_service.dart';
import 'package:flutter_news/model/all_author.dart';

class Authors extends StatefulWidget {
  const Authors({Key key}) : super(key: key);

  @override
  _AuthorsState createState() => _AuthorsState();
}

class _AuthorsState extends State<Authors> {
  List<AllAuthor> allAuthRes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Spacer(flex: 5),
            Expanded(
                flex: 6,
                child: Text(
                  "YAZARLAR",
                  style: TextStyle(color: Colors.black87),
                )),
            Spacer(flex: 5),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              GridView.builder(
                //  padding: EdgeInsets.all(MediaQuery.of(context).size.width/100),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: allAuthRes.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: (3 / 4),
                  crossAxisCount: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? 3
                      : 2,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).size.width / 50),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blueGrey[100],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.width / 1000),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.network(allAuthRes[index].image,
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.width / 50),
                              child: Text(
                                allAuthRes[index].authorName ?? '',
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
            ],
          ),
        ),
      ),
    );
  }
}
