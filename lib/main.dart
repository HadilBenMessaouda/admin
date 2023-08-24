// main.dart

import 'package:admin/allNews.dart';
import 'package:admin/store.dart';
import 'package:flutter/material.dart';
import 'news.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   final List<NewsArticle> allNews = [];   
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          debugShowCheckedModeBanner: false,

      initialRoute: '/',
      routes: {
         '/': (context) => AllNewsDisplayPage(allNews: allNews,),}
        
      //     initialRoute: '/',
      //  routes: {
      //     '/': (context) => StoreApp(store: store)}
        
  
    );
  }
}
