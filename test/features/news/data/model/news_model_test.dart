import 'package:ako_test/src/features/news/data/model/news_model.dart';
import 'package:ako_test/src/features/news/domain/entities/news.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("News Model class test", () {
    NewsModel? model;
    setUp(() {
      model = NewsModel(title: "news model 1");
    });

    test("is a sub class of News", () {
      expect(model, isA<News>());
    });
    test("fromJson test", () {
      var response = {
        "author": "detikcom",
        "title": "korban begal ngamuk",
        "url": "detik.com/korban-begal-ngamuk"
      };

      model = NewsModel.fromJson(response);
      expect(model, isA<NewsModel>());
      expect(model?.author, equals("detikcom"));
      expect(model?.title, isNotEmpty);
    });
  });
}
