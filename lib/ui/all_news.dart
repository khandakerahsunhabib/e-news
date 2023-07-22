import 'package:e_news/service/api_service.dart';
import 'package:flutter/material.dart';
import '../components/news_item_list.dart';
import '../model/news_model.dart';

class AllNews extends StatefulWidget {
  const AllNews({super.key});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  ApiService apiService = ApiService();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiService.getAllNews(),
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
    );
  }
}