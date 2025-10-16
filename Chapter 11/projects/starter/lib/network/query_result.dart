import 'package:freezed_annotation/freezed_annotation.dart';
import '../data/models/models.dart';

part 'query_result.freezed.dart';

part 'query_result.g.dart';

@freezed
abstract class QueryResult with _$QueryResult {
  factory QueryResult.fromJson(Map<String, dynamic> json) =>
      _$QueryResultFromJson(json);

  const factory QueryResult({
    required int offset,
    required int number,
    required int totalResults,
    required List<Recipe> recipes,
  }) = _QueryResult;

  // @override
  // // TODO: implement number
  // int get number => throw UnimplementedError();
  //
  // @override
  // // TODO: implement offset
  // int get offset => throw UnimplementedError();
  //
  // @override
  // // TODO: implement recipes
  // List<Recipe> get recipes => throw UnimplementedError();
  //
  // @override
  // Map<String, dynamic> toJson() {
  //   // TODO: implement toJson
  //   throw UnimplementedError();
  // }
  //
  // @override
  // // TODO: implement totalResults
  // int get totalResults => throw UnimplementedError();
}
