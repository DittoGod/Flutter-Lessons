
import 'package:recipes/data/models/recipe.dart';
import 'package:recipes/network/model_response.dart';
import 'package:recipes/network/query_result.dart';
import 'package:chopper/chopper.dart';

typedef RecipeResponse = Response<Result<QueryResult>>;
typedef RecipeDetailsResponse = Response<Result<Recipe>>;

abstract class ServiceInterface {
  /// Query recipes with the given query string
  /// offset is the starting point
  /// number is the number of items
  Future<RecipeResponse> queryRecipes(
      String query,
      int offset,
      int number,
      );

  /// Get the details of a specific recipe
  Future<RecipeDetailsResponse> queryRecipe(
      String id,
      );
}

