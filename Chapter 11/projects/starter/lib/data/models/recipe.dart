import 'package:freezed_annotation/freezed_annotation.dart';

import 'ingredient.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
abstract class Recipe with _$Recipe {
  const factory Recipe({
    int? id,
    String? label,
    String? image,
    String? description,
    @Default(false) bool bookmarked,
    @Default(<Ingredient>[]) List<Ingredient> ingredients
  }) = _Recipe;

  // Create a Recipe from JSON data
  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  // @override
  // // TODO: implement bookmarked
  // bool get bookmarked => throw UnimplementedError();
  //
  // @override
  // // TODO: implement description
  // String? get description => throw UnimplementedError();
  //
  // @override
  // // TODO: implement id
  // int? get id => throw UnimplementedError();
  //
  // @override
  // // TODO: implement image
  // String? get image => throw UnimplementedError();
  //
  // @override
  // // TODO: implement ingredients
  // List<Ingredient> get ingredients => throw UnimplementedError();
  //
  // @override
  // // TODO: implement label
  // String? get label => throw UnimplementedError();
  //
  // @override
  // Map<String, dynamic> toJson() {
  //   // TODO: implement toJson
  //   throw UnimplementedError();
  // }

}
