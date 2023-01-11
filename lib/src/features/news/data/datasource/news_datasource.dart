import 'package:ako_test/env.dart';
import 'package:ako_test/src/core/constants/constants.dart';
import 'package:ako_test/src/core/dio/dio_request.dart';
import 'package:ako_test/src/core/exceptions/exceptions.dart';
import 'package:ako_test/src/features/news/data/model/news_model.dart';

import 'package:dio/dio.dart';

abstract class NewsDatasource {
  Future<List<NewsModel>?> fetch({
    String? query,
  });
}

class NewsDatasourceImpl implements NewsDatasource {
  final DioRequest dio;
  NewsDatasourceImpl(this.dio);
  @override
  Future<List<NewsModel>?> fetch({String? query}) async {
    try {
      var endpoint = "top-headlines";
      var param = {
        "country": "id",
        "apiKey": Env.newsApiKey,
      };
      if ((query ?? '').isNotEmpty) {
        param['q'] = query!;
        param.remove("country");
        endpoint = "everything";
      }
      final response = await dio.get("$apiurl/$endpoint", params: param);
      var articles = response.data['articles'] as List;
      print("[NewsDatasourceImpl] fetch $apiurl $articles");
      if (articles.isEmpty) {
        throw DataNotFoundException("Data not found");
      }
      return articles.map((e) => NewsModel.fromJson(e)).toList();
    } on DioError catch (e) {
      print("[NewsDatasourceImpl] ${e.response}");
      throw DioErrorException(e.message);
    }
  }
}
