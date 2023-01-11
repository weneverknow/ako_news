import 'package:ako_test/src/core/exceptions/exceptions.dart';
import 'package:ako_test/src/core/failure/failure.dart';
import 'package:ako_test/src/features/news/data/datasource/news_datasource.dart';
import 'package:ako_test/src/features/news/domain/entities/news.dart';
import 'package:dartz/dartz.dart';

import '/src/features/news/domain/repository/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsDatasource datasource;
  NewsRepositoryImpl(this.datasource);
  @override
  Future<Either<Failure, List<News>>> fetch({
    String? query,
  }) async {
    try {
      final result = await datasource.fetch(
        query: query,
      );
      return right(result!.map((e) => e).toList());
    } on DataNotFoundException catch (e) {
      return left(FetchFailure(e.message));
    } on DioErrorException catch (e) {
      return left(FetchFailure(e.message));
    }
  }
}
