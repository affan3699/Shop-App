import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopapp/Screens/Favourite.dart';

import 'Login.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
            onTap: () {},
            icon: Icons.contacts,
            text: 'Old Previous Orders',
          ),
          _createDrawerItem(
            onTap: () {},
            icon: Icons.home,
            text: 'Edit Address',
          ),
          _createDrawerItem(
            onTap: () {},
            icon: Icons.person,
            text: 'About',
          ),
          _createDrawerItem(
            onTap: () {},
            icon: Icons.note,
            text: 'Policies',
          ),
          _createDrawerItem(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Favourite()));
            },
            icon: Icons.favorite,
            text: 'Favourite Products',
          )
        ],
      ),
    );
  }
}

Widget _createHeader() {
  return DrawerHeader(
    margin: EdgeInsets.zero,
    padding: EdgeInsets.zero,
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fill,
        image: NetworkImage(
            "https://i.pinimg.com/originals/c1/92/9d/c1929d3492c2f64ab65b43808c072043.jpg"),
      ),
    ),
    child: Stack(
      children: <Widget>[
        Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text("Flutter Step-by-Step",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500))),
      ],
    ),
  );
}

Widget _createDrawerItem(
    {required IconData icon,
    required String text,
    required GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text),
        )
      ],
    ),
    onTap: onTap,
  );
}
