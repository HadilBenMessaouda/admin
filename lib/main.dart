import 'package:admin/admin_login.dart';
import 'package:admin/dashbord_screen.dart';
import 'package:admin/news.dart';
import 'package:admin/store.dart';
import 'package:admin/user.dart';
import 'package:admin/users_screen.dart';
import 'package:flutter/material.dart';

import 'allNews.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final List<User> allUsers = [];
 //  MyApp({super.key});
   final List<NewsArticle> allNews = [];   

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     // title: 'Flutter Demo',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      initialRoute: '/',
      routes: {
         '/news': (context) => AllNewsDisplayPage(allNews: allNews,),
          '/': (context) => LogInPage(),
        '/dashboard': (context) => DashboardPage(),
        '/ges_user': (context) => UsersPage(allUsers: [],),
        '/news': (context) => AllNewsDisplayPage(allNews: allNews,),
       }
        
      //     initialRoute: '/',
      //  routes: {
      //     '/': (context) => StoreApp(store: store)}
        
  
    );


  }
}
