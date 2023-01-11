import 'package:ako_test/src/core/constants/constants.dart';
import 'package:ako_test/src/features/news/presentation/bloc/news_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsSearchBox extends StatelessWidget {
  NewsSearchBox({super.key});

  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: TextField(
        controller: _searchController,
        onSubmitted: (val) {
          context.read<NewsListBloc>().add(NewsListLoad(
                query: val,
              ));
        },
        decoration: InputDecoration(
            suffixIcon: GestureDetector(
                onTap: () {
                  _searchController.clear();
                  context.read<NewsListBloc>().add(NewsListLoad());
                },
                child: Icon(Icons.clear)),
            hintText: "search keyword",
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  width: 0.5,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  width: 0.5,
                ))),
      ),
    );
  }
}
