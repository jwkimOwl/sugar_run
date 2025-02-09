import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../frontend/ChoicePage.dart';
import '../frontend/MenuPage.dart';

import 'dart:convert';

class MealPage extends StatefulWidget {
  const MealPage({super.key, required this.title});
  final String title;
  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 40,right:40,top:10,bottom:10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top:50,bottom:50),
              child:TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xffffe8e8),
                  labelText: 'Enter your menu',
                ),
                maxLines: 18,
              ),),
              
              IconButton(
                icon: const Image(image: AssetImage("assets/img/Vector_ Submit_menu.png")),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ChoicePage(title:"a",user_query: _controller.text,)),
                  );
                },
                
              ),
              Text("Powered by Nutritionix"),
            ],)
        ),
      ),
    );
  }

}
