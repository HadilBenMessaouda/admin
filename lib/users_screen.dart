
import 'dart:ui';

import 'package:admin/components/sidemenu.dart';
import 'package:admin/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user.dart';

class UsersPage extends StatefulWidget {
  final List<User> allUsers;
  UsersPage({required this.allUsers});
 
final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();


  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {

final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

 // User? selectedOption ;
// static const int numItems =5;
// List<User> allUsers = List.generate(numItems, (index) => User(
//    id: "1", 
//    name: "eya", 
//    email: "eya@gmail.com"));



 void _addUser() {
  setState(() {
  String id = idController.text;
  String name = nameController.text;
  String email = emailController.text;

    User newUser = User(
      email: email,
      name: name,
      id: id, 
    );

   // userProvider.addUser(newUser);
    widget.allUsers.add(newUser);

    emailController.clear();
    nameController.clear();
    idController.clear(); 
});
  }

    

    
Future<void> _dialogBuilderAdd(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Add New User',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
           Padding(
                  padding: EdgeInsets.symmetric(vertical:15)
                ),
             
            
                TextFormField(
                  controller: idController,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18.0,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Id',
                    hintStyle: TextStyle(
                      color: Colors.red.withOpacity(0.7),
                      fontSize: 15.0,
                    ),
                    filled: true,
                    fillColor: Colors.transparent,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red.withOpacity(0.5),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
          Padding(
                  padding: EdgeInsets.symmetric(vertical:10)
                ),
               
                               TextFormField(
                  controller: nameController,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18.0,
                  ),
                  decoration: InputDecoration(
                    hintText: ' Name',
                    hintStyle: TextStyle(
                      color: Colors.red.withOpacity(0.7),
                      fontSize: 15.0,
                    ),
                    filled: true,
                    fillColor: Colors.transparent,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red.withOpacity(0.5),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
               Padding(
                  padding: EdgeInsets.symmetric(vertical:10)
                ),
                TextFormField(
                  controller: emailController,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18.0,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: Colors.red.withOpacity(0.7),
                      fontSize: 15.0,
                    ),
                    filled: true,
                    fillColor: Colors.transparent,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red.withOpacity(0.5),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                
              Padding(
                  padding: EdgeInsets.symmetric(vertical:20)
                ),
              
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text(
                        'ADD',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
                      ),
              onPressed: () {
                _addUser();
                 Navigator.of(context).pop();
            
              },
            ),
        Padding(
                  padding: EdgeInsets.symmetric(horizontal:30)
                ),
            ElevatedButton(
              child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
                      ),
              
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],),
          ],
        );
      },
    );
  }


   
void _editUser(int index) async {
  User user =widget.allUsers[index];
    TextEditingController idController = TextEditingController(text: user.id);
    TextEditingController nameController = TextEditingController(text: user.name);
    TextEditingController emailController = TextEditingController(text: user.email);
  
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Update User',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
               Padding(
                  padding: EdgeInsets.symmetric(vertical:20)
                ),
            
                TextFormField(
                  controller: idController,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18.0,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Id',
                    hintStyle: TextStyle(
                      color: Colors.red.withOpacity(0.7),
                      fontSize: 15.0,
                    ),
                    filled: true,
                    fillColor: Colors.transparent,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red.withOpacity(0.5),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                  Padding(
                  padding: EdgeInsets.symmetric(vertical:10)
                ),
                TextFormField(
                  controller: nameController,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18.0,
                  ),
                  decoration: InputDecoration(
                    hintText: ' Name',
                    hintStyle: TextStyle(
                      color: Colors.red.withOpacity(0.7),
                      fontSize: 15.0,
                    ),
                    filled: true,
                    fillColor: Colors.transparent,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red.withOpacity(0.5),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical:10)
                ),
                TextFormField(
                  controller: emailController,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18.0,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: Colors.red.withOpacity(0.7),
                      fontSize: 15.0,
                    ),
                    filled: true,
                    fillColor: Colors.transparent,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red.withOpacity(0.5),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical:20)
                ),
              
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text(
                        'Update',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
                      ),
              onPressed: ()  {
                setState(() {
                  User editedUser = User(
                    id: idController.text,
                    name: nameController.text,
                    email: emailController.text,
                  );
                 widget.allUsers[index] = editedUser;
               
                });
                //  widget.allUsers.id=widget.idController.text;

                  // User editedUser = User(
                  //   id: idController.text,
                  //   name: nameController.text,
                  //   email: emailController.text,
                   
                  // );
              //    widget.allUsers[index] = editedUser;
               
                Navigator.of(context).pop(); // Close the dialog after saving changes
              
            }
            ),
       
            Padding(
                  padding: EdgeInsets.symmetric(horizontal:30)
                ),
               
            ElevatedButton(
              child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
                      ),
              
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],),
          ],
        );
      },
    );
  }


 void _deleteNews(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete User',
           style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),),
          content: Text('Are you sure you want to delete this user? \n If you delete this user he will be deleted definitlly\n he will never be able to enter to the mobile app\n',
           style: TextStyle(
              fontSize: 16,
          ),),
          actions: [
            Padding(
                  padding: EdgeInsets.symmetric(vertical:20)
                ),
           
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text(
                 'Delete',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
                      ),
              onPressed: () {
              setState(() {
                  widget.allUsers.removeAt(index);
                });
                Navigator.of(context).pop(); // Close the dialog after deleting the article
              },
            ),
            
            Padding(
                  padding: EdgeInsets.symmetric(horizontal:30)
                ),
            ElevatedButton(
              child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
                      ),
              
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
     
      // appBar: AppBar(
      //   title: Text('Users',
      //   style: TextStyle(
      //     fontWeight: FontWeight.bold,
      //     fontSize: 25,
      //   ),),
      // ),
      
      body: SafeArea(
        child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            Padding(
              padding: EdgeInsets.only(top:12, left: 25)),
        Row(
         children: [
            Padding(padding: EdgeInsets.only(left: 20,bottom: 30),),
            Text('Users',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),),
        ],),
            Row(
              children: [
              
                Padding(
                  padding: EdgeInsets.only(left:30,top:26)
                ),
              
  //               DecoratedBox(
  // decoration: BoxDecoration( 
  //    color:Colors.black, //background color of dropdown button
  //    border: Border.all(color: Colors.black38, width:3), //border of dropdown button
  //    borderRadius: BorderRadius.circular(50), //border raiuds of dropdown button
  //    boxShadow: <BoxShadow>[
  //           BoxShadow(
  //               color: Colors.white, //shadow for button
  //               blurRadius: 5) //blur radius of shadow
  //         ]
  // ),
  
  // child:Padding(
  //   padding: EdgeInsets.only(left:30, right:30),
  //               child : DropdownButton<User>(
  //                 value: selectedOption,
  //                 onChanged: (newValue) {
  //                   setState(() {
  //                     selectedOption = newValue;
  //                   });
  //                 },
  //                 icon: Padding( //Icon at tail, arrow bottom is default icon
  //       padding: EdgeInsets.only(left:20),
  //       child:Icon(Icons.arrow_circle_down_sharp)
  //     ), 
  //     iconEnabledColor: Colors.white, //Icon color
  //     style: TextStyle(  //te
  //        color: Colors.white, //Font color
  //        fontSize: 20 
  //     ),
  //     dropdownColor: Colors.black, //dropdown background color
  //     underline: Container(), //remove underline
    
  //                 items: users.map((option) {
  //                   return DropdownMenuItem<User>(
  //                     value: option,
  //                     child: Text("e"),
  //                   );
  //                 }).toList(),
  //               ),),
  //               ),
  //              Padding(
  //                 padding: EdgeInsets.symmetric(horizontal:15)
  //               ),
  //             
              //   ElevatedButton(
              //     onPressed: () {
              //      // searchUsers(searchText);
              //     },
              //     child: Text('Search',
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 16,
              //     ),),
              //     style: ElevatedButton.styleFrom(
              //   padding: EdgeInsets.symmetric(
              //     vertical: 20.0,
              //     horizontal: 32.0,
              //   ),
              //   backgroundColor: Colors.grey,
              //   foregroundColor: Colors.white),
              //   ),
              //   Expanded(child: Container(alignment:Alignment.topRight)),
                 Padding(
                  padding: EdgeInsets.only(right: 20),
                 ),
                 ElevatedButton(
                onPressed: () => _dialogBuilderAdd(context),
                child: Text(
                  "Add",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 32.0,
                ),
                backgroundColor: Colors.grey,
                foregroundColor: Colors.white),
               
              )],
            ),
  Padding(
                  padding: EdgeInsets.symmetric(vertical:40)
                ),
               
            ListView.builder(
               shrinkWrap: true,
        itemCount: widget.allUsers.length,
        itemBuilder: (context, index) {
          User user = widget.allUsers[index];
          return    
            DataTable(
          columns: [
            DataColumn(label: Text('')),
            DataColumn(label: Text('id')),
            DataColumn(label: Text('User Name')),
            DataColumn(label: Text('email')),
            DataColumn(label: Text('')),
            DataColumn(label: Text('')),
          ],
          rows: [
            DataRow(
              cells: [
              DataCell(Checkbox(value: false, onChanged: (bool? value) { },)),
              DataCell(Text('${user.id}')),
              DataCell(Text('${user.name}')),
              DataCell(Text('${user.email}')),
              DataCell(
                ElevatedButton( 
                    onPressed: () {
                       _editUser(index);
                    },
                  child: Text('Update',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),),
                  style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 32.0,
                ),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white),
                ),),
              DataCell(
                ElevatedButton( 
                  onPressed: () => _deleteNews(index),
                  child: Text('Delete',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),),
                  style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 32.0,
                ),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white),
                ),),
              ]),
            ]  );
        }),    
          ]  
               
          
        ),
      ),
      ),
    );
  }
}