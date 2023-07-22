import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_news/model/news_model.dart';
import 'package:e_news/ui/news_details.dart';
import 'package:flutter/material.dart';

class NewsItemList extends StatelessWidget {
  const NewsItemList({super.key, required this.newsModel});

  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewsDetails(newsModel: newsModel),
            ));
      },
      child: Card(
        color: Colors.black26,
        shadowColor: Colors.grey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal:5),
          margin: const EdgeInsets.symmetric(horizontal:5),
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
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Container(
                      padding: const EdgeInsets.only(
                          top: 5, bottom: 5, right: 10, left: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Text(newsModel.source!.name.toString())),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    newsModel.publishedAt.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                  newsModel.author == null
                      ? ""
                      : "News Source: ${newsModel.author}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white)),
              const SizedBox(
                height: 5,
              ),
              Text(newsModel.title.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white)),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
