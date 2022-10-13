// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  final imageurl =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXk8GFwTIaLBXPZgdAcBsGqI-NaJlq9xiNYQ&usqp=CAU";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(children: [
          UserAccountsDrawerHeader(
            accountName: Text("Akshay Potkhule"),
            accountEmail: Text("abpotkhule_b21@it.vjti.ac.in"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(imageurl),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              size: 28,
              color: Colors.white,
            ),
            title: Text(
              "My Profile",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.home,
              size: 28,
              color: Colors.white,
            ),
            title: Text(
              "Home",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.sportscourt,
              size: 28,
              color: Colors.white,
            ),
            title: Text(
              "Tournament",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          )
        ]),
      ),
    );
  }
}
