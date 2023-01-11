import 'package:ako_test/src/features/news/domain/entities/news.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("News entities class test", () {
    News? news1;
    News? news2;
    setUp(() {
      news1 = News(title: "News 1");
      news2 = News(title: "News 2", author: "detikcom");
    });

    test("is a object of News", () {
      expect(news1, isA<News>());
      expect(news1, isA<News>());
    });
    test("check value of property", () {
      expect(news1?.title, equals("News 1"));
      expect(news1?.author, isNull);
      expect(news2?.title, equals("News 2"));
      expect(news2?.author, equals("detikcom"));
    });
    test("check equatable", () {
      expect(news1 == news2, isFalse);
      news2 = news1;
      expect(news1 == news2, isTrue);
    });
  });
}
