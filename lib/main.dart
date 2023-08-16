import 'package:admin/admin_login.dart';
import 'package:admin/dashbord_screen.dart';
import 'package:admin/user.dart';
import 'package:admin/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // ChangeNotifierProvider(
    //   create: (context) => UserProvider(),
    //   child: 
      MyApp(),
  //),
  );
}

class MyApp extends StatelessWidget {
  final List<User> allUsers = [];
   MyApp({super.key});

  // This widget is the root of your application.
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
        '/': (context) => LogInPage(),
        '/dashboard': (context) => DashboardPage(),
        '/ges_user': (context) => UsersPage(allUsers: [],),
        // '/signin': (context) => SignInPage(),
        // '/interface': (context) => Interface1(),
        // '/store': (context) => StorePage(),
      },
      
     // home:UsersPage(allUsers: allUsers,),
     );
  }
}
