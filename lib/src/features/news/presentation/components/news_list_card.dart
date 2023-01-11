import 'package:ako_test/src/features/news/domain/entities/news.dart';
import 'package:ako_test/src/features/news/presentation/news_detail_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/image_network_wrapper.dart';

class NewsListCard extends StatelessWidget {
  const NewsListCard({required this.news, super.key});
  final News news;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      padding: const EdgeInsets.all(defaultPadding / 4),
      //color: Colors.amber,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          news.urlToImage == null
              ? Image.asset(
                  "assets/images/No-image-available.png",
                  width: 100,
                  height: 120,
                  fit: BoxFit.cover,
                )
              : ImageNetworkWrapper(
                  width: 100, height: 120, imageUrl: news.urlToImage ?? ''),
          const SizedBox(
            width: defaultPadding / 2,
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  news.title ?? '',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: defaultPadding / 4,
                ),
                Text(
                  news.author ?? '',
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
