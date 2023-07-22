import 'dart:io';
import 'package:e_news/service/http_override.dart';
import 'package:e_news/ui/home_page.dart';
import 'package:flutter/material.dart';

void main() {
   HttpOverrides.global = MyHttpOverrides();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'English News Paper',
      home: HomePage()
    );
  }
}
