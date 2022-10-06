import 'package:flutter_news/model/all_author.dart';
import 'package:flutter_news/model/author_all_post.dart';
import 'package:flutter_news/model/cat_post.dart';
import 'package:flutter_news/model/category.dart';
import 'package:flutter_news/model/detail.dart';
import 'package:flutter_news/model/headline.dart';
import 'package:flutter_news/model/home_first_module.dart';
import 'package:flutter_news/model/home_last_article.dart';
import 'package:flutter_news/model/home_second_module.dart';
import 'package:flutter_news/model/recommended_content.dart';
import 'package:http/http.dart' as http;

class NewsService {
  final String base_url = "";

  Future<List<HomeLastArticle>> fetchPost() async {
    final response = await http.get(Uri.parse(base_url + "homelastarticle"));

    if (response.statusCode == 200) {
      return homeLastArticleFromJson(response.body);
    } else {
      throw Exception("Hata Oluştu..");
    }
  }

  Future<List<Headline>> getHeadline() async {
    final response = await http.get(Uri.parse(base_url + 'headline'));
    if (response.statusCode == 200) {
      return headlineFromJson(response.body);
    } else {
      throw Exception("Hata Oluştu..");
    }
  }

  Future<List<Category>> getCategory() async {
    final response = await http.get(Uri.parse(base_url + 'catlist'));
    if (response.statusCode == 200) {
      var result = categoryFromJson(response.body);
      return result;
    } else {
      throw Exception("Hata Oluştu..");
    }
  }

  Future<List<HomeFirst>> getHomeFirst() async {
    final response = await http.get(Uri.parse(base_url + 'homefirstmodule'));
    if (response.statusCode == 200) {
      return homeFirstFromJson(response.body);
    } else {
      throw Exception("Hata Oluştu..");
    }
  }

  Future<List<HomeLastArticle>> getHomeLastArticle() async {
    final response = await http.get(Uri.parse(base_url + 'homelastarticle'));
    if (response.statusCode == 200) {
      var result = homeLastArticleFromJson(response.body);
      return result;
    } else {
      throw Exception("Hata Oluştu..");
    }
  }

  Future<List<HomeSecond>> getHomeSecond() async {
    final response = await http.get(Uri.parse(base_url + 'homesecondmodule'));
    if (response.statusCode == 200) {
      return homeSecondFromJson(response.body);
    } else {
      throw Exception("Hata Oluştu..");
    }
  }

  Future<List<CatPost>> getCatPost(String number) async {
    final response = await http.get(Uri.parse(base_url + 'category/$number'));
    if (response.statusCode == 200) {
      var result = catPostFromJson(response.body);
      return result;
    } else {
      throw Exception("Hata Oluştu..");
    }
  }

  Future<List<Detail>> getDetail(String number) async {
    final response = await http.get(Uri.parse(base_url + 'detail/$number'));
    if (response.statusCode == 200) {
      var result = detailFromJson(response.body);
      return result;
    } else {
      throw Exception("Hata Oluştu..");
    }
  }

  Future<List<AllAuthor>> getAllAuthor() async {
    final response = await http.get(Uri.parse(base_url + 'allauthor'));
    if (response.statusCode == 200) {
      var result = allAuthorFromJson(response.body);
      return result;
    } else {
      throw Exception("Hata Oluştu..");
    }
  }

  Future getRecoContent() async {
    final response = await http.get(Uri.parse(base_url + 'recommendedcontent'));
    if (response.statusCode == 200) {
      var result5 = recoContentFromJson(response.body);
      return result5;
    } else {
      throw Exception("Hata Oluştu..");
    }
  }

  Future getAuthorPost() async {
    try {
      final response = await http.get(Uri.parse(base_url + 'authorallpost/16'));
      if (response.statusCode == 200) {
        var result = authorPostFromJson(response.body);
        return result;
      } else {
        throw Exception("Hata Oluştu..");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
