import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../frontend/MealPage.dart';
import '../frontend/ProfilePage.dart';

import 'dart:convert';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key, required this.title});
  final String title;
  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10,right:10,top:10),
            child: IconButton(
              icon: const Image(image: AssetImage("assets/img/Add_meal.png")),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MealPage(title:"Meal",)),
                  );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10,right:10,top:10),
            child: IconButton(
              icon: const Image(image: AssetImage("assets/img/Learn.png")),
              onPressed: () {
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10,right:10,top:10),
            child: IconButton(
              icon: const Image(image: AssetImage("assets/img/Games.png")),
              onPressed: () {
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10,right:10,top:10),
            child: IconButton(
              icon: const Image(image: AssetImage("assets/img/Profile.png")),
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil('/', ModalRoute.withName('/'));
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10,right:10,top:10),
            child: IconButton(
              icon: const Image(image: AssetImage("assets/img/leader_board.png")),
              onPressed: () {
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10,right:10,top:10),
            child: IconButton(
              icon: const Image(image: AssetImage("assets/img/settings.png")),
              onPressed: () {
              },
            ),
          )
        ],
      ),
    );
  }

}
