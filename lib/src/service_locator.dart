import 'package:ako_test/src/core/dio/dio_request.dart';
import 'package:ako_test/src/features/news/data/datasource/news_datasource.dart';
import 'package:ako_test/src/features/news/data/repository/news_repository_impl.dart';
import 'package:ako_test/src/features/news/domain/repository/news_repository.dart';
import 'package:ako_test/src/features/news/domain/usecase/fetch_news.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

setupServiceLocator() {
  /**
   * register dio
   */
  sl.registerLazySingleton<Dio>(() => Dio());
  /**
   * register dio request
   */
  sl.registerLazySingleton<DioRequest>(() => DioRequest(sl<Dio>()));

  /**
   * register data source
   */
  sl.registerLazySingleton<NewsDatasource>(
      () => NewsDatasourceImpl(sl<DioRequest>()));

  /**
   * register repository
   */
  sl.registerLazySingleton<NewsRepository>(
      () => NewsRepositoryImpl(sl<NewsDatasource>()));

  /**
   * register usecase
   */
  sl.registerLazySingleton<FetchNews>(() => FetchNews(sl<NewsRepository>()));
}
