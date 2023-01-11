import 'package:ako_test/src/core/failure/failure.dart';
import 'package:ako_test/src/features/news/domain/entities/news.dart';
import 'package:dartz/dartz.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<News>>> fetch({
    String? query,
  });
}
