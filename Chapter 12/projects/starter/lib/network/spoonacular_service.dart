import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:recipes/network/env.dart';

import 'package:recipes/data/models/recipe.dart';
import 'package:recipes/mock_service/mock_service.dart';
import 'package:recipes/network/model_response.dart';
import 'package:recipes/network/query_result.dart';
import 'package:recipes/network/service_interface.dart';
import 'package:recipes/network/spoonacular_model.dart';

const String apiKey = Env.apiKey;
const String apiUrl = 'https://api.spoonacular.com/';

class SpoonacularService implements ServiceInterface {
  // getData() returns a value if Future, with an uppercase "F", because it
  // takes some time to get the data from the server. An "API's" returned data
  // type is determined in the future, lowercase "f". async signifies this
  // method performs an asynchronous operation.
  Future getData(String url) async {
    // response has to wait until the HTTP gets the data from the server. The
    // await keyword tells the function to wait. Response and get() are from the
    // HTTP package. get() fetches data from the provided url.
    final response = await http.get(Uri.parse(url));
    // A statusCode of 200 means the request was successful.
    if (response.statusCode == 200) {
      // Return the results embedded in response.body.
      return response.body;
    } else {
      // Otherwise, print the statusCode to the console if there is an error.
      log(response.statusCode.toString());
    }
  }

  // Override an unimplemented method for querying a specific recipe.
  @override
  Future<RecipeDetailsResponse> queryRecipe(String recipeId) {
    // TODO: implement queryRecipe
    throw UnimplementedError();
  }

  // Create a new method, queryRecipes(), with the parameters query, offset and
  // number. These help get specific pages from the complete query. offset
  // starts at 0, and number is calculated by adding the offset index to page
  // size. Use a return type of Future<RecipeResponse> for this method because
  // the response will be a RecipeResponse in the future when it finishes. async
  // signals that this method runs asynchronous.
  @override
  Future<RecipeResponse> queryRecipes(
    String query,
    int offset,
    int number,
  ) async {
    // final creates a non-changing variable. Use await to tell the app to wait
    // until getData() returns its result. The getData() API URL is created with
    // the variables passed in.
    final recipeData = await getData(
      '${apiUrl}recipes/complexSearch?apiKey=$apiKey&query=$query&offset=$offset&number=$number',
    );
    // Convert the JSON string to a SpoonacularResults class with the help of
    // fromJson() method.
    final spoonacularResults = SpoonacularResults.fromJson(
      jsonDecode(recipeData),
    );
    // Convert SpoonacularResults class object into a list of recipes.
    final recipes = spoonacularResultsToRecipe(spoonacularResults);
    // Create a QueryResult object with those results.
    final apiQueryResults = QueryResult(
      offset: spoonacularResults.offset,
      number: spoonacularResults.number,
      totalResults: spoonacularResults.totalResults,
      recipes: recipes,
    );
    // Return a Success with the query result.
    return Success(apiQueryResults);
  }
}
