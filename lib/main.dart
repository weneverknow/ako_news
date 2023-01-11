import 'package:ako_test/src/features/news/domain/usecase/fetch_news.dart';
import 'package:ako_test/src/features/news/presentation/bloc/news_list_bloc.dart';
import 'package:ako_test/src/features/news/presentation/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/service_locator.dart' as serviceLocator;

void main() {
  serviceLocator.setupServiceLocator();
  Bloc.observer = MySimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) =>
                NewsListBloc(fetchNews: serviceLocator.sl<FetchNews>())
                  ..add(NewsListLoad())),
      ],
      child: MaterialApp(
          title: 'News Api Org',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: NewsScreen()),
    );
  }
}

class MySimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    print("bloc ${bloc.runtimeType} $change ");
    super.onChange(bloc, change);
  }
}
