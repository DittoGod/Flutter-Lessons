import '../data/models/recipe.dart';
import 'model_response.dart';
import 'query_result.dart';

/// A type definition for a response that contains a [QueryResult].
typedef RecipeResponse = Result<QueryResult>;

/// A type definition for a response that contains a single [Recipe].
typedef RecipeDetailsResponse = Result<Recipe>;

/// An abstract class that defines the interface for a recipe service.
abstract class ServiceInterface {
  /// Queries recipes with the given [query] string.
  ///
  /// [offset] is the starting point of the results.
  /// [number] is the number of items to return.
  Future<RecipeResponse> queryRecipes(
    String query,
    int offset,
    int number,
  );

  /// Gets the details of a specific recipe by its [id].
  Future<RecipeDetailsResponse> queryRecipe(
    String id,
  );
}
