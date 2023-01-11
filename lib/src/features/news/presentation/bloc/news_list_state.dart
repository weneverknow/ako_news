part of 'news_list_bloc.dart';

abstract class NewsListState extends Equatable {
  // const NewsListState();

  // @override
  // List<Object> get props => [];
}

class NewsListInitial extends NewsListState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NewsListLoadedSuccess extends NewsListState {
  final List<News> news;
  NewsListLoadedSuccess(this.news);
  @override
  // TODO: implement props
  List<Object?> get props => [news];
}

class NewsListLoadedFailed extends NewsListState {
  final String message;
  NewsListLoadedFailed(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
