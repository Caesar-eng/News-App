import 'package:dio/dio.dart';
import 'package:news_app/model/article_model.dart';

class NewsService {
  final String category;
  final Dio dio;
  NewsService(this.dio, this.category);

  Future<List<ArticleModel>> getNews() async {
    Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=33568afe4c874cbbab3be4e9097f0787&category=$category');
    Map<String, dynamic> jsonData = response.data;
    List<dynamic> articles = jsonData['articles'];
    List<ArticleModel> articlesList = [];
    for (var article in articles) {
      ArticleModel articleModel = ArticleModel(
        title: article['title'],
        imageUrl: article['urlToImage'],
        describtion: article['description'],
      );
      articlesList.add(articleModel);
    }

    return articlesList;
  }
}
