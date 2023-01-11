import 'package:ako_test/src/features/news/domain/entities/source.dart';

import '/src/features/news/domain/entities/news.dart';

class NewsModel extends News {
  NewsModel({
    Map<String, dynamic>? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) : super(
          source: source == null ? null : Source.fromJson(source),
          author: author,
          title: title,
          description: description,
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt == null
              ? DateTime.now()
              : DateTime.parse(publishedAt),
          content: content,
        );
  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        source: json['source'],
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: (json["publishedAt"]),
        content: json["content"],
      );
}
