import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_news/model/news_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatefulWidget {
  const NewsDetails({super.key, required this.newsModel});

  final NewsModel newsModel;

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          title: Text(widget.newsModel.title.toString())),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Card(
          color: Colors.black26,
          shadowColor: Colors.grey,
          child: Container(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 210,
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: widget.newsModel.urlToImage.toString(),
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Container(
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 10, right: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          widget.newsModel.source!.name.toString(),
                        )),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(widget.newsModel.publishedAt.toString().substring(0,10),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white))
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                    widget.newsModel.author == null
                        ? ""
                        : "News Source: ${widget.newsModel.author}",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white)),
                const SizedBox(
                  height: 5,
                ),
                Text(widget.newsModel.title.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white)),
                const SizedBox(
                  height: 8,
                ),
                Text(widget.newsModel.description.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white)),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () async {
                      final Uri uri = Uri.parse(widget.newsModel.url.toString());
                      if (!await launchUrl(uri)) {
                        throw Exception("Could not launch");
                      }
                    },
                    child: const Text("Read More..."))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
