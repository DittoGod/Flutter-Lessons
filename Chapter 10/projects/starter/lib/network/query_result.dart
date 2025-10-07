/// Represents the result of a query.
import 'package:freezed_annotation/freezed_annotation.dart';
import '../data/models/models.dart';

part 'query_result.freezed.dart';

part 'query_result.g.dart';

@freezed
class QueryResult with _$QueryResult {
  /// Creates a new [QueryResult] instance.
  ///
  /// [offset]: The starting offset of the results.
  /// [number]: The number of results returned.
  /// [totalResults]: The total number of results found.
  /// [recipes]: A list of recipes.
  const factory QueryResult({
    /// The starting offset of the results.
    required int offset,
    /// The number of results returned.
    required int number,
    /// The total number of results found.
    required int totalResults,
    /// A list of recipes.
    required List<Recipe> recipes,
  }) = _QueryResult;

  /// Creates a new [QueryResult] instance from a JSON map.
  factory QueryResult.fromJson(Map<String, dynamic> json) =>
      _$QueryResultFromJson(json);
}
