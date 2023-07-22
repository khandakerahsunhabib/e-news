import 'package:e_news/components/news_item_list.dart';
import 'package:e_news/model/news_model.dart';
import 'package:e_news/service/api_service.dart';
import 'package:flutter/material.dart';

class BreakingNews extends StatefulWidget {
  const BreakingNews({super.key});

  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: const EdgeInsets.all(13),
        child: FutureBuilder(
          future: apiService.getBreakingNews(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<NewsModel> articlesList = snapshot.data ?? [];
              return ListView.builder(
                itemCount: articlesList.length,
                itemBuilder: (context, index) {
                  return NewsItemList(
                    newsModel: articlesList[index],
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
