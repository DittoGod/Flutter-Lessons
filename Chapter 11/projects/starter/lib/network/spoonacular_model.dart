import 'package:json_annotation/json_annotation.dart';
import 'package:recipes/data/models/models.dart';

part 'spoonacular_model.g.dart';

/// Represents the results of a Spoonacular API search.
@JsonSerializable()
class SpoonacularResults {
  /// A list of search results.
  List<SpoonacularResult> results;
  /// The starting offset of the results.
  int offset;
  /// The number of results returned.
  int number;
  /// The total number of results found.
  int totalResults;

  /// Creates a new [SpoonacularResults] instance.
  SpoonacularResults({
    required this.results,
    required this.offset,
    required this.number,
    required this.totalResults,
  });

  /// Creates a new [SpoonacularResults] instance from a JSON map.
  factory SpoonacularResults.fromJson(Map<String, dynamic> json) =>
      _$SpoonacularResultsFromJson(json);

  /// Converts this [SpoonacularResults] instance to a JSON map.
  Map<String, dynamic> toJson() => _$SpoonacularResultsToJson(this);
}

/// Represents a single Spoonacular API search result.
@JsonSerializable()
class SpoonacularResult {
  /// The unique ID of the recipe.
  int id;
  /// The title of the recipe.
  String title;
  /// The URL of the recipe image.
  String image;
  /// The type of the recipe image.
  String imageType;

  /// Creates a new [SpoonacularResult] instance.
  SpoonacularResult({
    required this.id,
    required this.title,
    required this.image,
    required this.imageType,
  });

  /// Creates a new [SpoonacularResult] instance from a JSON map.
  factory SpoonacularResult.fromJson(Map<String, dynamic> json) =>
      _$SpoonacularResultFromJson(json);

  /// Converts this [SpoonacularResult] instance to a JSON map.
  Map<String, dynamic> toJson() => _$SpoonacularResultToJson(this);
}

/// Represents a detailed Spoonacular recipe.
@JsonSerializable()
class SpoonacularRecipe {
  /// The number of minutes for preparation.
  int preparationMinutes;
  /// The number of minutes for cooking.
  int cookingMinutes;
  /// The name of the source.
  String sourceName;
  /// A list of extended ingredients.
  List<ExtendedIngredient> extendedIngredients;
  /// The unique ID of the recipe.
  int id;
  /// The title of the recipe.
  String title;
  /// The total time in minutes to get the recipe ready.
  int readyInMinutes;
  /// The number of servings.
  int servings;
  /// The URL of the source.
  String sourceUrl;
  /// The URL of the recipe image.
  String image;
  /// The type of the recipe image.
  String imageType;
  /// A summary of the recipe.
  String summary;
  /// The instructions for the recipe. Can be null.
  String? instructions;

  /// Creates a new [SpoonacularRecipe] instance.
  SpoonacularRecipe({
    required this.preparationMinutes,
    required this.cookingMinutes,
    required this.sourceName,
    required this.extendedIngredients,
    required this.id,
    required this.title,
    required this.readyInMinutes,
    required this.servings,
    required this.sourceUrl,
    required this.image,
    required this.imageType,
    required this.summary,
    this.instructions,
  });

  /// Creates a new [SpoonacularRecipe] instance from a JSON map.
  factory SpoonacularRecipe.fromJson(Map<String, dynamic> json) =>
      _$SpoonacularRecipeFromJson(json);

  /// Converts this [SpoonacularRecipe] instance to a JSON map.
  Map<String, dynamic> toJson() => _$SpoonacularRecipeToJson(this);
}

/// Represents an extended ingredient.
@JsonSerializable()
class ExtendedIngredient {
  /// The unique ID of the ingredient.
  int id;
  /// The aisle where the ingredient can be found. Can be null.
  String? aisle;
  /// The URL of the ingredient image. Can be null.
  String? image;
  /// The name of the ingredient.
  String name;
  /// The clean name of the ingredient. Can be null.
  String? nameClean;
  /// The original string of the ingredient.
  String original;
  /// The original name of the ingredient. Can be null.
  String? originalName;
  /// The amount of the ingredient.
  double amount;
  /// The unit of the ingredient.
  String unit;

  /// Creates a new [ExtendedIngredient] instance.
  ExtendedIngredient({
    required this.id,
    required this.aisle,
    required this.image,
    required this.name,
    required this.nameClean,
    required this.original,
    required this.originalName,
    required this.amount,
    required this.unit,
  });

  /// Creates a new [ExtendedIngredient] instance from a JSON map.
  factory ExtendedIngredient.fromJson(Map<String, dynamic> json) =>
      _$ExtendedIngredientFromJson(json);

  /// Converts this [ExtendedIngredient] instance to a JSON map.
  Map<String, dynamic> toJson() => _$ExtendedIngredientToJson(this);
}

/// Converts [SpoonacularResults] to a list of [Recipe] objects.
List<Recipe> spoonacularResultsToRecipe(SpoonacularResults result) {
  final recipes = <Recipe>[];
  for (final result in result.results) {
    recipes.add(spoonacularToRecipe(result));
  }
  return recipes;
}

/// Converts a [SpoonacularResult] to a [Recipe].
Recipe spoonacularToRecipe(SpoonacularResult result) {
  return Recipe(
      id: result.id,
      image: result.image,
      label: result.title,
      bookmarked: false,
      ingredients: const <Ingredient>[],
      description: result.title);
}

/// Converts a [SpoonacularRecipe] to a [Recipe].
Recipe spoonacularRecipeToRecipe(SpoonacularRecipe spoonacularRecipe) {
  final ingredients = <Ingredient>[];
  for (final ingredient in spoonacularRecipe.extendedIngredients) {
    ingredients.add(Ingredient(
        id: ingredient.id,
        name: ingredient.name,
        amount: ingredient.amount,
        recipeId: spoonacularRecipe.id));
  }
  return Recipe(
    id: spoonacularRecipe.id,
    label: spoonacularRecipe.title,
    image: spoonacularRecipe.image,
    bookmarked: false,
    description: spoonacularRecipe.summary,
    ingredients: ingredients,
  );
}
