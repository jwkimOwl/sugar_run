import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../frontend/ChoicePage.dart';
import '../frontend/MenuPage.dart';

import 'dart:convert';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.title});
  final String title;
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _user_score=0;
  void _loadScore() async {
    // Get shared perence instance.
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      // Shared preferences getter.
      _user_score = (prefs.getInt('score') ?? 0);
    });
  }
  @override
  Widget build(BuildContext context) {
    _loadScore();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Color(0xffff7c7c),
        title: Padding(padding: EdgeInsets.only(left: 10,right:10,top:50,bottom:50),
        child: const Image(image: AssetImage("assets/img/Sugar Run.png")),),
        actions: [
          IconButton(
            icon: const Image(image: AssetImage("assets/img/menuicon.png")),
            iconSize: 50,
            onPressed: () {
              Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MenuPage(title: 'Menu',)),
                  );
            },
            )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/profile_page.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          child:Padding(
            padding: EdgeInsets.only(left: 130,right:40,top:270,bottom:10),
            child: Text("Score:  " + _user_score.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white)),
          ),
        )
      ),
    );
  }

}
