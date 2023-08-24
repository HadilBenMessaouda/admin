import 'package:flutter/material.dart';

class User {
    String id;
   String name;
   String email;
 

  User({
    required this.id,
    required this.name,
    required this.email,
  });
}

// class UserProvider with ChangeNotifier {
//   List<User> allUsers = [];

//   List<User> get users => allUsers;

//   void addUser(User user) {
//     allUsers.add(user);
//     notifyListeners();
//   }
// }