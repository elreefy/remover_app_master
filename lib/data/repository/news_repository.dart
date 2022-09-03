// import 'package:news_app/data/api/news_api.dart';
// import 'package:news_app/data/models/articles.dart';
// import 'package:news_app/shared/constants/strings.dart';
//
// class NewsRepository {
//
//   static Future<List<Article>> getAllArticles(
//       {required String category}) async {
//     final articles = await DioHelper.getData(
//         query: {'country': 'eg', 'category': category, 'apiKey': apiKey});
//     return articles.map((article) => Article.fromJson(article)).toList();
//   }
//  static Future<List<Article>> getSearchedArticles(String keyWord) async {
//     final articles = await DioHelper.getSearchedData(
//         query: {'q': keyWord, 'apiKey': apiKey, 'sortBy': 'publishedAt'});
//     return articles.map((article) => Article.fromJson(article)).toList();
//   }
// }
