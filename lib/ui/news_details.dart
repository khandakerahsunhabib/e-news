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
      appBar: AppBar(title: Text(widget.newsModel.title.toString())),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              height: 250,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              imageUrl: widget.newsModel.urlToImage.toString(),
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
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(widget.newsModel.source!.name.toString())),
                const SizedBox(
                  width: 8,
                ),
                Text(widget.newsModel.publishedAt.toString())
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(widget.newsModel.author == null
                ? ""
                : "News Source: ${widget.newsModel.author}"),
            const SizedBox(
              height: 5,
            ),
            Text(widget.newsModel.title.toString()),
            const SizedBox(
              height: 8,
            ),
            Text(widget.newsModel.description.toString()),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: () async{
              final Uri uri = Uri.parse(widget.newsModel.url.toString());
              if(!await launchUrl(uri)){
                throw Exception("Could not launch");
              }
            }, child: const Text("Read More..."))
          ],
        ),
      ),
    );
  }
}
