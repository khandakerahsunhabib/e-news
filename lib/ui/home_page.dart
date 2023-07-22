import 'package:e_news/ui/all_news.dart';
import 'package:e_news/ui/breaking_news.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Flutter News App'),
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'Breaking',
                ),
                Tab(
                  text: 'All News',
                )
              ],
            ),
          ),
          body: const TabBarView(children: [BreakingNews(), AllNews()]),
        ));
  }
}
