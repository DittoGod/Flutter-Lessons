import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient.freezed.dart';

part 'ingredient.g.dart';

@freezed
class Ingredient with _$Ingredient {
  const factory Ingredient(
      {int? id,
        int? recipeId,
        String? name,
        double? amount,
        double? weight}) = _Ingredient;

  // Create a Ingredient from JSON data
  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);

  // @override
  // // TODO: implement amount
  // double? get amount => throw UnimplementedError();
  //
  // @override
  // // TODO: implement id
  // int? get id => throw UnimplementedError();
  //
  // @override
  // // TODO: implement name
  // String? get name => throw UnimplementedError();
  //
  // @override
  // // TODO: implement recipeId
  // int? get recipeId => throw UnimplementedError();
  //
  // @override
  // Map<String, dynamic> toJson() {
  //   // TODO: implement toJson
  //   throw UnimplementedError();
  // }
  //
  // @override
  // // TODO: implement weight
  // double? get weight => throw UnimplementedError();

}
