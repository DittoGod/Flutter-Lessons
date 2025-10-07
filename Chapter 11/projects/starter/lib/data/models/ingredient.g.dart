// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Ingredient _$IngredientFromJson(Map<String, dynamic> json) => _Ingredient(
  id: (json['id'] as num?)?.toInt(),
  recipeId: (json['recipeId'] as num?)?.toInt(),
  name: json['name'] as String?,
  amount: (json['amount'] as num?)?.toDouble(),
  weight: (json['weight'] as num?)?.toDouble(),
);

Map<String, dynamic> _$IngredientToJson(_Ingredient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recipeId': instance.recipeId,
      'name': instance.name,
      'amount': instance.amount,
      'weight': instance.weight,
    };
