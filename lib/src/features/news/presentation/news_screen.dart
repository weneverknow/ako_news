import 'package:ako_test/src/core/constants/constants.dart';

import 'package:ako_test/src/features/news/domain/entities/news.dart';
import 'package:ako_test/src/features/news/presentation/bloc/news_list_bloc.dart';
import 'package:ako_test/src/features/news/presentation/components/news_list_card.dart';
import 'package:ako_test/src/features/news/presentation/components/news_search_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'news_detail_screen.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "News Api",
          style: Theme.of(context).textTheme.headline5?.copyWith(
                color: Colors.black,
              ),
        ),
      ),
      body: Column(
        children: [
          NewsSearchBox(),
          const SizedBox(
            height: defaultPadding,
          ),
          Flexible(
            child: BlocBuilder<NewsListBloc, NewsListState>(
                builder: (context, state) {
              if (state is NewsListLoadedFailed) {
                return Center(
                  child: Text(
                    state.message,
                    style: Theme.of(context).textTheme.button?.copyWith(
                          color: Colors.red.shade300,
                        ),
                  ),
                );
              }
              if (state is NewsListLoadedSuccess) {
                var news = state.news;
                return ListView.builder(
                    itemCount: news.length,
                    itemBuilder: (context, index) {
                      News item = news[index];

                      return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => NewsDetailScreen(news: item)));
                          },
                          child: NewsListCard(news: item));
                    });
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
          )
        ],
      ),
    );
  }
}
