import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
      //  padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
           child: Image(image: AssetImage('assets/images/logo.png')),
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('Dashbord'),
            onTap: () {
              Navigator.pushNamed(context, '/dashboard');
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Users'),
            onTap: () {
            Navigator.pushNamed(context, '/ges_user');
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: () {
              // Naviguer vers la page d'accueil
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Paramètres'),
            onTap: () {
              // Naviguer vers la page des paramètres
            },
          ),
          Divider(),

          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log out'),
            onTap: () {
              // Naviguer vers la page d'accueil
            },
          ),
          // Ajouter d'autres éléments de menu ici
        ],
      ),
    );
  }
}
