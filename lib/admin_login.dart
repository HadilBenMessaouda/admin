import 'package:admin/dashbord_screen.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogInPage> {
  bool _isPasswordVisible = false;
  final TextEditingController _passwordController = TextEditingController();
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              // Wrap with SingleChildScrollView
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Image.asset(
                      'assets/images/et.png',
                      width: 80,
                      height: 80,
                    ),
                  ),
                  SizedBox(height:20.0),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'ADMIN LOGIN',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                 
                  SizedBox(height: 25.0),
                  TextFormField(
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16.0,
                    ),
                    decoration: InputDecoration(
                      icon: Icon(Icons.email,
                      color: Colors.red,) ,
                      hintText: ' Enter Username or Email',
                      hintStyle: TextStyle(
                        color: Colors.red.withOpacity(0.5),
                        fontSize: 16.0,
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red.withOpacity(0.2),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
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
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16.0,
                    ),
                    decoration: InputDecoration(
                      icon: Icon(Icons.password, 
                      color: Colors.red,) ,
                      hintText: '  Password',
                      hintStyle: TextStyle(
                        color: Colors.red.withOpacity(0.5),
                        fontSize: 16.0,
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red.withOpacity(0.2),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Color.fromARGB(255, 112, 93, 93).withOpacity(0.7),
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      child: Text(
                        'Forget Password!',
                        style: TextStyle(
                          color: Colors.red.withOpacity(0.7),
                          fontSize: 14.0,
                        ),
                      ),
                      onPressed: () { 
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => recoveryPage()),
                        //   );
                          },
                    ),
                  ),
                  SizedBox(height: 15.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DashboardPage()),
                        );
                      },
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(vertical: 25.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
                          ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}