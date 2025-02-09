import 'package:flutter/material.dart';
import'package:flutter/widgets.dart';
import 'package:sugar_run/src/frontend/ProfilePage.dart';

import '../backend/ApiService.dart';
import '../backend/Nutrition.dart';
import '../frontend/MenuPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';
import 'dart:math';

class ChoicePage extends StatefulWidget {
  const ChoicePage({super.key, required this.title, required this.user_query});
  final String title;
  final String user_query;
  @override
  State<ChoicePage> createState() => _ChoicePageState();
}

class _ChoicePageState extends State<ChoicePage> {
  final ApiService _apiService = ApiService();
  List<Nutrition> _response = [];
  List<Item> items=[];
  double score=0;
  int _user_score=0;
  dynamic prefs;
  AssetImage face=AssetImage("assets/img/low_face.png");
  @override
  void initState() {
    super.initState();
    fetchUserData(widget.user_query);
    _loadScore();
  }
  Future<void> fetchUserData(String input) async {
    final splitted = input.split('\n');
    print(splitted);
    List<Nutrition> nutritions=[];
    for(String menu_item in splitted){
      try {
        final response = await _apiService.post('v2/natural/nutrients', _apiService.body(menu_item));
        Nutrition response_class;
        //print(response.statusCode);
        //print(response.body);
        if (response.statusCode == 200) {
          response_class= Nutrition.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
        } else {
          print(response.body);
          throw Exception('Failed to load nutritionnnn');
        }
        if(!response_class.available()){
          response_class=response_class.markUnavailable();
        }
        nutritions.add(response_class);
      } catch (e) {
        print("invalid input");
      }
    }
    setState(() {
      _response = nutritions;
      items =
      List.generate(_response.length, (index) => Item(data:  _response[index], isChecked: false));
    });
  }

  double calculate_score(){
    double ans=0,gi_sum=0,count=0,total_fat=0,total_fiber=0,total_sugar=0,total_protein=0;
    for(int i=0;i<items.length;i++){
      if(items[i].isChecked){
        if(!items[i].data.available()){
          print("unavailable");
          return 0;
        }
        count+=1;
        gi_sum+=items[i].data.gi_score();
        total_fat+=items[i].data.totalFat;
        total_fiber+=items[i].data.dietaryFiber;
        total_sugar+=items[i].data.sugars;
        total_protein+=items[i].data.protein;
      }
    }
    if(count==0){
      return 0;
    }
    ans=50-(gi_sum/(2*count));
    double gram_scale = 60/(total_protein+total_fat+total_sugar+total_fiber);
    double balance=100-(2.5*(gram_scale*total_protein-25).abs())-(2*(gram_scale*total_fat-15).abs())-(max(3*(gram_scale*total_sugar-7),0))-(max(3*(10-gram_scale*total_fiber),0));
    print(ans.toString()+",  "+balance.toString());
    ans+=min(50,max(0,balance/2));
    return ans/100.0;
  }

  void _loadScore() async {
    // Get shared perence instance.
    prefs = await SharedPreferences.getInstance();
    setState(() {
      // Shared preferences getter.
      _user_score = (prefs.getInt('score') ?? 0);
    });
  }


  @override
  Widget build(BuildContext context) {
    /*for(Item item in items){
      print(item.data.foodName+" "+item.isChecked.toString());
    }*/
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(10),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  child: CheckboxListTile(
                    title: Center(
                      child: Text(
                        items[index].data.foodName,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    value: items[index].isChecked,
                    onChanged: (value) => setState(
                      () {
                        items[index] =
                            items[index].copyWith(isChecked: !items[index].isChecked);
                        score=calculate_score();
                        if(score<0.35){
                          face=AssetImage("assets/img/low_face.png");
                        } else if (score<0.65){
                          face=AssetImage("assets/img/middle_face.png");
                        } else{
                          face=AssetImage("assets/img/high_face.png");
                        }
                        print(prefs==null);
                      },
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(left: 40,right:40,top:20),
              child: LinearProgressIndicator(
                value: score,
                minHeight: 10,
              )
            ),
            Padding(
              padding: EdgeInsets.only(left: 40,right:40),
              child: Image(image: face)
            ),
            Padding(
              padding: EdgeInsets.only(left: 40,right:40),
              child: IconButton(
                icon: const Image(image: AssetImage("assets/img/Vector_ Submit_menu.png")),
                onPressed: () {
                  int addition=0;
                  if(score<0.35){
                    addition=10;
                  } else if (score<0.65){
                    addition=20;
                  } else{
                    addition=30;
                  }
                  prefs.setInt('score', _user_score+addition);
                  Navigator.of(context).pushNamedAndRemoveUntil('/', ModalRoute.withName('/'));
                },
                
              ),
            )

          ],),
      ),
    );
  }

}

class Item {
  final Nutrition data;
  final bool isChecked;

  Item({
    required this.data,
    required this.isChecked,
  });

  Item copyWith({
    Nutrition? data,
    bool? isChecked,
  }) {
    return Item(
      data: data ?? this.data,
      isChecked: isChecked ?? this.isChecked,
    );
  }
}