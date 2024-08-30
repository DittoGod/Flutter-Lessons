import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipes/data/models/models.dart';

part 'current_recipe_data.freezed.dart';

@freezed
class CurrentRecipeData with _$CurrentRecipeData {
  const factory CurrentRecipeData({
    @Default(<Recipe>[]) List<Recipe> currentRecipes,
    @Default(<Ingredient>[]) List<Ingredient> currentIngredients,
  }) = _CurrentRecipeData;
}
