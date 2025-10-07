// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QueryResult _$QueryResultFromJson(Map<String, dynamic> json) => _QueryResult(
  offset: (json['offset'] as num).toInt(),
  number: (json['number'] as num).toInt(),
  totalResults: (json['totalResults'] as num).toInt(),
  recipes: (json['recipes'] as List<dynamic>)
      .map((e) => Recipe.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$QueryResultToJson(_QueryResult instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'number': instance.number,
      'totalResults': instance.totalResults,
      'recipes': instance.recipes,
    };
