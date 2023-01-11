import 'package:ako_test/src/core/failure/failure.dart';
import 'package:ako_test/src/core/usecase/usecase.dart';
import 'package:ako_test/src/features/news/domain/repository/news_repository.dart';
import 'package:dartz/dartz.dart';

import '../entities/news.dart';

class FetchNews implements UseCase<List<News>, FetchNewsParam> {
  final NewsRepository repository;
  const FetchNews(this.repository);
  @override
  Future<Either<Failure, List<News>>> call(FetchNewsParam param) async {
    return await repository.fetch(
      query: param.query,
    );
  }
}

class FetchNewsParam {
  final String? query;
  FetchNewsParam({this.query});
}
