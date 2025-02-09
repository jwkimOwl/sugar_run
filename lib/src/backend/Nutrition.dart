class Nutrition {
  final dynamic foodName;
  final dynamic calories;
  final dynamic totalFat;
  final dynamic saturatedFat;
  final dynamic cholesterol;
  final dynamic sodium;
  final dynamic totalCarbohydrate;
  final dynamic dietaryFiber;
  final dynamic sugars;
  final dynamic protein;
  /*
  "nf_calories": 33.81,
      "nf_total_fat": 0.08,
      "nf_saturated_fat": 0.03,
      "nf_cholesterol": 0,
      "nf_sodium": 0.98,
      "nf_total_carbohydrate": 8.87,
      "nf_dietary_fiber": 0.44,
      "nf_sugars": 7.59,
      "nf_protein": 0.35
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
    required this.protein,
  });

  factory Nutrition.fromJson(Map<String, dynamic> json) {
    return Nutrition(
      foodName: json['foods'][0]['food_name']?.toString() ?? 'Unknown',
      calories: json['foods'][0]['nf_calories']?.toDouble() ?? 'Unknown',
      totalFat: json['foods'][0]['nf_total_fat']?.toDouble() ?? 'Unknown',
      saturatedFat: json['foods'][0]['nf_saturated_fat']?.toDouble() ?? 'Unknown',
      cholesterol: json['foods'][0]['nf_cholesterol']?.toDouble() ?? 'Unknown',
      sodium: json['foods'][0]['nf_sodium']?.toDouble() ?? 'Unknown',
      totalCarbohydrate: json['foods'][0]['nf_total_carbohydrate']?.toDouble() ?? 'Unknown',
      dietaryFiber: json['foods'][0]['nf_dietary_fiber']?.toDouble() ?? 'Unknown',
      sugars: json['foods'][0]['nf_sugars']?.toDouble() ?? 'Unknown',
      protein: json['foods'][0]['nf_protein']?.toDouble() ?? 'Unknown',
    );
  }

  double score() {
    if (totalFat == 'Unknown') return -1;
    if (totalCarbohydrate == 'Unknown') return -1;
    if (sugars == 'Unknown') return -1;
    if (dietaryFiber == 'Unknown') return -1;
    if (protein == 'Unknown') return -1;
    double gi = (((totalCarbohydrate*0.75) + (sugars*1.25) - (dietaryFiber*0.5)) / ((protein*0.5) + (totalFat*0.3) +1)) * 100;
    
    double health_score = ((100 - gi)/2)-(sugars/2)+(protein/5)+(totalFat/10);
    return health_score;
  }
}