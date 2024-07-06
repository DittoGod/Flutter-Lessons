// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$RecipeService extends RecipeService {
  _$RecipeService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = RecipeService;

  @override
  Future<Response<Result<APIRecipeQuery>>> queryRecipes(
    String query,
    int from,
    int to,
  ) {
    final Uri $url = Uri.parse('search');
    final Map<String, dynamic> $params = <String, dynamic>{
      'q': query,
      'from': from,
      'to': to,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<Result<APIRecipeQuery>, APIRecipeQuery>($request);
  }
}
