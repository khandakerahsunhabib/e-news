import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_news/model/news_model.dart';
import 'package:flutter/material.dart';

class NewsItemList extends StatelessWidget {
  const NewsItemList({super.key, required this.newsModel});

  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            height: 250,
            width: double.infinity,
            fit: BoxFit.fitWidth,
            imageUrl: newsModel.urlToImage.toString(),
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Row(
            children: [
              Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(newsModel.source!.name.toString())),
              const SizedBox(
                width: 8,
              ),
              Text(newsModel.publishedAt.toString())
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(newsModel.author == null
              ? ""
              : "News Source: ${newsModel.author}"),
          const SizedBox(
            height: 5,
          ),
          Text(newsModel.title.toString()),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
