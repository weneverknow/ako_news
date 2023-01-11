import 'package:ako_test/src/core/usecase/usecase.dart';
import 'package:ako_test/src/features/news/domain/entities/news.dart';
import 'package:ako_test/src/features/news/domain/usecase/fetch_news.dart';
import 'package:ako_test/src/service_locator.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'news_list_event.dart';
part 'news_list_state.dart';

class NewsListBloc extends Bloc<NewsListEvent, NewsListState> {
  NewsListBloc({required this.fetchNews}) : super(NewsListInitial()) {
    on<NewsListEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<NewsListLoad>(_load);
  }
  final FetchNews fetchNews; //= sl<FetchNews>();
  Future<void> _load(NewsListLoad event, Emitter<NewsListState> emit) async {
    emit(NewsListInitial());
    final result = await fetchNews.call(FetchNewsParam(
      query: event.query,
    ));
    result.fold((l) => emit(NewsListLoadedFailed(l.message)),
        (r) => emit(NewsListLoadedSuccess(r)));
  }
}
