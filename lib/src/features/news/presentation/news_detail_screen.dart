import 'package:ako_test/src/core/format/format.dart';
import 'package:ako_test/src/core/widgets/image_network_wrapper.dart';
import 'package:ako_test/src/features/news/domain/entities/news.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';

class NewsDetailScreen extends StatelessWidget {
  NewsDetailScreen({required this.news, super.key});
  final News news;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: size.height * 0.3,
            child: Stack(
              children: [
                news.urlToImage == null
                    ? Image.asset(
                        "assets/images/No-image-available.png",
                        width: size.width,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        news.urlToImage!,
                        fit: BoxFit.cover,
                      ),
                buildBackButton(context)
              ],
            ),
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      news.author ?? '',
                      style: Theme.of(context).textTheme.button,
                    ),
                    Text(
                      Format.date(news.publishedAt ?? DateTime.now()),
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          ?.copyWith(color: Colors.red.shade400),
                    )
                  ],
                ),
                const SizedBox(
                  height: defaultPadding / 4,
                ),
                Text(
                  news.title ?? '',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: defaultPadding / 2,
                ),
                Text(
                  news.description ?? 'content not found',
                  style: Theme.of(context).textTheme.caption,
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildBackButton(BuildContext context) {
    return FittedBox(
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: defaultPadding / 2,
            vertical: defaultPadding / 2,
          ),
          padding: EdgeInsets.all(defaultPadding / 4),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.black54),
          alignment: Alignment.center,
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
