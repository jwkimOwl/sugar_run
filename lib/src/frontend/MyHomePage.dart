import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../backend/ApiService.dart';
import '../backend/Nutrition.dart';

import 'dart:convert';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ApiService _apiService = ApiService();
  String _response = "";
  final TextEditingController _controller = TextEditingController();

  Future<void> fetchUserData(String input) async {
    final response = await _apiService.post('v2/natural/nutrients', _apiService.body(input));
    String response_string="YUMMY";
    Nutrition response_class;
    //print(response.statusCode);
    //print(response.body);
    if (response.statusCode == 200) {
      response_class= Nutrition.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load nutritionnnn');
    }
    response_string = response_class.foodName + "\n" + 
                      "Calories: " + response_class.calories.toString() + "\n" + 
                      "Total Fat: " + response_class.totalFat.toString() + "\n" + 
                      "Total Saturated Fat: " + response_class.saturatedFat.toString() + "\n" + 
                      "Total Cholesterol: " + response_class.cholesterol.toString() + "\n" + 
                      "Total Sodium: " + response_class.sodium.toString() + "\n" + 
                      "Total Carbs: " + response_class.totalCarbohydrate.toString() + "\n" + 
                      "Total Fiber: " + response_class.dietaryFiber.toString() + "\n" + 
                      "Total Sugar: " + response_class.sugars.toString() + "\n" +
                      "Total Protein: " + response_class.protein.toString() + "\n" +
                      response_class.score().toString() + "\n" +
                      response_class.gi_score().toString();
    setState(() {
      _response = response_string;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nutritionix API Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your input',
              ),
            ),
            ElevatedButton(
              onPressed: () => fetchUserData(_controller.text),
              child: const Text('Fetch Data'),
            ),
            const SizedBox(height: 20),
            Text(_response),
          ],
        ),
      ),
    );
  }

}
