import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'src/backend/ApiService.dart';

import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    
    return MaterialApp(
      title: 'Nutritionix API Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Nutritionix API Example'),
    );
  }
}

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
    if (response.statusCode == 200) {
      response_class= Nutrition.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load nutritionnnn');
    }
    response_string = response_class.foodName + "\n" + response_class.calories.toString() + "\n" + response_class.totalFat.toString() + "\n" + response_class.saturatedFat.toString() + "\n" + response_class.cholesterol.toString() + "\n" + response_class.sodium.toString() + "\n" + response_class.totalCarbohydrate.toString() + "\n" + response_class.dietaryFiber.toString() + "\n" + response_class.sugars.toString();
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

class Nutrition {
  final String foodName;
  final double calories;
  final double totalFat;
  final double saturatedFat;
  final double cholesterol;
  final double sodium;
  final double totalCarbohydrate;
  final double dietaryFiber;
  final double sugars;
  /*
  "nf_calories": 33.81,
      "nf_total_fat": 0.08,
      "nf_saturated_fat": 0.03,
      "nf_cholesterol": 0,
      "nf_sodium": 0.98,
      "nf_total_carbohydrate": 8.87,
      "nf_dietary_fiber": 0.44,
      "nf_sugars": 7.59,
  */

  const Nutrition({
    required this.foodName,
    required this.calories,
    required this.totalFat,
    required this.saturatedFat,
    required this.cholesterol,
    required this.sodium,
    required this.totalCarbohydrate,
    required this.dietaryFiber,
    required this.sugars,
  });

  factory Nutrition.fromJson(Map<String, dynamic> json) {
    return Nutrition(
      foodName: json['foods'][0]['food_name'] as String,
      calories: (json['foods'][0]['nf_calories'] as num).toDouble(),
      totalFat: (json['foods'][0]['nf_total_fat'] as num).toDouble(),
      saturatedFat: (json['foods'][0]['nf_saturated_fat'] as num).toDouble(),
      cholesterol: (json['foods'][0]['nf_cholesterol'] as num).toDouble(),
      sodium: (json['foods'][0]['nf_sodium'] as num).toDouble(),
      totalCarbohydrate: (json['foods'][0]['nf_total_carbohydrate'] as num).toDouble(),
      dietaryFiber: (json['foods'][0]['nf_dietary_fiber'] as num).toDouble(),
      sugars: (json['foods'][0]['nf_sugars'] as num).toDouble(),
    );
  }
}