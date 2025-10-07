// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Recipe _$RecipeFromJson(Map<String, dynamic> json) => _Recipe(
  id: (json['id'] as num?)?.toInt(),
  label: json['label'] as String?,
  image: json['image'] as String?,
  description: json['description'] as String?,
  bookmarked: json['bookmarked'] as bool? ?? false,
  ingredients:
      (json['ingredients'] as List<dynamic>?)
          ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Ingredient>[],
);

Map<String, dynamic> _$RecipeToJson(_Recipe instance) => <String, dynamic>{
  'id': instance.id,
  'label': instance.label,
  'image': instance.image,
  'description': instance.description,
  'bookmarked': instance.bookmarked,
  'ingredients': instance.ingredients,
};
