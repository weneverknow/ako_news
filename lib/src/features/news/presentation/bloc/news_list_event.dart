part of 'news_list_bloc.dart';

abstract class NewsListEvent extends Equatable {
  // const NewsListEvent();

  // @override
  // List<Object> get props => [];
}

class NewsListLoad extends NewsListEvent {
  final String? query;
  NewsListLoad({this.query});
  @override
  List<Object?> get props => [query];
}
