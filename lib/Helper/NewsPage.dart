import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_app_flutter/Models/ArticleModel.dart';
import 'file:///C:/Users/anand/AndroidStudioProjects/news_app_flutter/lib/Helper/apiKey.dart';

class News {

  List<ArticleModel> news  = [];

  Future<void> getNews() async{
    String url = "http://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=${apiKey}";
    // String url ="https://newsapi.org/v2/sources?apiKey=${apiKey}";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          ArticleModel article = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publishedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}
class NewsForCategory {

  List<ArticleModel> Categorynews  = [];

  Future<void> getNewsForCountry(String category) async{
    String url = "http://newsapi.org/v2/top-headlines?country=gb&category=$category&apiKey=${apiKey}";
    // String url = "https://newsapi.org/v2/sources?category=$category&apiKey=${apiKey}";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          ArticleModel article = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publishedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          Categorynews.add(article);
        }
      });
    }
  }
}


