import 'package:admin/components/sidemenu.dart';
import 'package:admin/responsive.dart';
import 'package:admin/users_screen.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             if (Responsive.isDesktop(context))
            Expanded(
              flex: 5,
              child: SideMenu(),
            ),
             Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
