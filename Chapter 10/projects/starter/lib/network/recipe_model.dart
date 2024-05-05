import 'package:json_annotation/json_annotation.dart';
part 'recipe_model.g.dart';

@JsonSerializable()
class APIRecipeQuery {
  factory APIRecipeQuery.fromJson(Map<String, dynamic> json) =>
      _$APIRecipeQueryFromJson(json);
  Map<String, dynamic> toJson() => _$APIRecipeQueryToJson(this);

  @JsonKey(name: 'q')
  String query;
  int from;
  int to;
  bool more;
  int count;
  List<APIHits> hits;

  APIRecipeQuery({
    required this.query,
    required this.from,
    required this.to,
    required this.more,
    required this.count,
    required this.hits,
  });
}

// Marks the class serializable.
@JsonSerializable()
class APIHits {
  // Defines a field of class APIRecipe.
  APIRecipe recipe;
  // Defines a constructor that accepts a recipe parameter.
  APIHits({
    required this.recipe,
  });
  // Adds the methods for JSON serialization.
  factory APIHits.fromJson(Map<String, dynamic> json) =>
      _$APIHitsFromJson(json);
  Map<String, dynamic> toJson() => _$APIHitsToJson(this);
}

@JsonSerializable()
class APIRecipe {
  // Define the fields for a recipe. label is the text shown and image is the
  // URL of the image to show.
  String label;
  String image;
  String url;

  // State that each recipe has a list of ingredients.
  List<APIIngredients> ingredients;
  double calories;
  double totalWeight;
  double totalTime;

  APIRecipe({
    required this.label,
    required this.image,
    required this.url,
    required this.ingredients,
    required this.calories,
    required this.totalWeight,
    required this.totalTime,
  });

  // Create the factory methods for serializing JSON.
  factory APIRecipe.fromJson(Map<String, dynamic> json) =>
      _$APIRecipeFromJson(json);
  Map<String, dynamic> toJson() => _$APIRecipeToJson(this);
}

// Add a helper method to turn a calorie into a string.
String getCalories(double? calories) {
  if (calories == null) {
    return '0 KCAL';
  }
  return '${calories.floor()} KCAL';
}

// Add another helper method to turn the weight into a string.
String getWeight(double? weight) {
  if (weight == null) {
    return '0g';
  }
  return '${weight.floor()}g';
}

@JsonSerializable()
class APIIngredients {
  // State that the name field of this class maps to the JSON field named text.
  @JsonKey(name: 'text')
  String name;
  double weight;
  APIIngredients({
    required this.name,
    required this.weight,
  });

  // Create the methods to serialize JSON.
  factory APIIngredients.fromJson(Map<String, dynamic> json) =>
      _$APIIngredientsFromJson(json);
  Map<String, dynamic> toJson() => _$APIIngredientsToJson(this);
}
