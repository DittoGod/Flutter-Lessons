// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'query_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QueryResult {

 int get offset; int get number; int get totalResults; List<Recipe> get recipes;
/// Create a copy of QueryResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QueryResultCopyWith<QueryResult> get copyWith => _$QueryResultCopyWithImpl<QueryResult>(this as QueryResult, _$identity);

  /// Serializes this QueryResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QueryResult&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.number, number) || other.number == number)&&(identical(other.totalResults, totalResults) || other.totalResults == totalResults)&&const DeepCollectionEquality().equals(other.recipes, recipes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,offset,number,totalResults,const DeepCollectionEquality().hash(recipes));

@override
String toString() {
  return 'QueryResult(offset: $offset, number: $number, totalResults: $totalResults, recipes: $recipes)';
}


}

/// @nodoc
abstract mixin class $QueryResultCopyWith<$Res>  {
  factory $QueryResultCopyWith(QueryResult value, $Res Function(QueryResult) _then) = _$QueryResultCopyWithImpl;
@useResult
$Res call({
 int offset, int number, int totalResults, List<Recipe> recipes
});




}
/// @nodoc
class _$QueryResultCopyWithImpl<$Res>
    implements $QueryResultCopyWith<$Res> {
  _$QueryResultCopyWithImpl(this._self, this._then);

  final QueryResult _self;
  final $Res Function(QueryResult) _then;

/// Create a copy of QueryResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? offset = null,Object? number = null,Object? totalResults = null,Object? recipes = null,}) {
  return _then(_self.copyWith(
offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,totalResults: null == totalResults ? _self.totalResults : totalResults // ignore: cast_nullable_to_non_nullable
as int,recipes: null == recipes ? _self.recipes : recipes // ignore: cast_nullable_to_non_nullable
as List<Recipe>,
  ));
}

}


/// Adds pattern-matching-related methods to [QueryResult].
extension QueryResultPatterns on QueryResult {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QueryResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QueryResult() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QueryResult value)  $default,){
final _that = this;
switch (_that) {
case _QueryResult():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QueryResult value)?  $default,){
final _that = this;
switch (_that) {
case _QueryResult() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int offset,  int number,  int totalResults,  List<Recipe> recipes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QueryResult() when $default != null:
return $default(_that.offset,_that.number,_that.totalResults,_that.recipes);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int offset,  int number,  int totalResults,  List<Recipe> recipes)  $default,) {final _that = this;
switch (_that) {
case _QueryResult():
return $default(_that.offset,_that.number,_that.totalResults,_that.recipes);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int offset,  int number,  int totalResults,  List<Recipe> recipes)?  $default,) {final _that = this;
switch (_that) {
case _QueryResult() when $default != null:
return $default(_that.offset,_that.number,_that.totalResults,_that.recipes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QueryResult implements QueryResult {
  const _QueryResult({required this.offset, required this.number, required this.totalResults, required final  List<Recipe> recipes}): _recipes = recipes;
  factory _QueryResult.fromJson(Map<String, dynamic> json) => _$QueryResultFromJson(json);

@override final  int offset;
@override final  int number;
@override final  int totalResults;
 final  List<Recipe> _recipes;
@override List<Recipe> get recipes {
  if (_recipes is EqualUnmodifiableListView) return _recipes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recipes);
}


/// Create a copy of QueryResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QueryResultCopyWith<_QueryResult> get copyWith => __$QueryResultCopyWithImpl<_QueryResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QueryResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueryResult&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.number, number) || other.number == number)&&(identical(other.totalResults, totalResults) || other.totalResults == totalResults)&&const DeepCollectionEquality().equals(other._recipes, _recipes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,offset,number,totalResults,const DeepCollectionEquality().hash(_recipes));

@override
String toString() {
  return 'QueryResult(offset: $offset, number: $number, totalResults: $totalResults, recipes: $recipes)';
}


}

/// @nodoc
abstract mixin class _$QueryResultCopyWith<$Res> implements $QueryResultCopyWith<$Res> {
  factory _$QueryResultCopyWith(_QueryResult value, $Res Function(_QueryResult) _then) = __$QueryResultCopyWithImpl;
@override @useResult
$Res call({
 int offset, int number, int totalResults, List<Recipe> recipes
});




}
/// @nodoc
class __$QueryResultCopyWithImpl<$Res>
    implements _$QueryResultCopyWith<$Res> {
  __$QueryResultCopyWithImpl(this._self, this._then);

  final _QueryResult _self;
  final $Res Function(_QueryResult) _then;

/// Create a copy of QueryResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? offset = null,Object? number = null,Object? totalResults = null,Object? recipes = null,}) {
  return _then(_QueryResult(
offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,totalResults: null == totalResults ? _self.totalResults : totalResults // ignore: cast_nullable_to_non_nullable
as int,recipes: null == recipes ? _self._recipes : recipes // ignore: cast_nullable_to_non_nullable
as List<Recipe>,
  ));
}


}

// dart format on
