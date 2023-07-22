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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                height: 210,
                width: double.infinity,
                fit: BoxFit.fitWidth,
                imageUrl: widget.newsModel.urlToImage.toString(),
                imageBuilder: (context, imageProvider) => Container(
                  width: double.infinity,
                  height: 210,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(25)),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
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
                    Text(
                        widget.newsModel.publishedAt
                            .toString()
                            .substring(0, 10),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 10, right: 5),
                child: Text(
                    widget.newsModel.author == null
                        ? ""
                        : "Written By: ${widget.newsModel.author}",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 10, right: 5),
                child: Text(widget.newsModel.title.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Colors.white)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 15, right: 5),
                child: Text(widget.newsModel.description.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ElevatedButton(
                    onPressed: () async {
                      final Uri uri =
                          Uri.parse(widget.newsModel.url.toString());
                      if (!await launchUrl(uri)) {
                        throw Exception("Could not launch");
                      }
                    },
                    child: const Text("Read More...")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
