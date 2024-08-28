import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'model_response.dart';
import 'query_result.dart';
import 'spoonacular_model.dart';

// Create SpoonacularConverter class to implement the ChopperConverter abstract
// class.
class SpoonacularConverter implements Converter {
  // Override convertRequest(), which takes in a request and returns a new
  // request.
  @override
  Request convertRequest(Request request) {
    // Add a header to the request that says you have a request type of
    // application/json using jsonHeaders. These constants are part of Chopper.
    final req = applyHeader(
      request,
      contentTypeKey,
      jsonHeaders,
      override: false,
    );

    // Call encodeJson() to convert the request to a JSON-encoded one, as
    // required by the server API.
    return encodeJson(req);
  }

  Request encodeJson(Request request) {
    // Get the content type from the request headers.
    final contentType = request.headers[contentTypeKey];
    // Check if contentType is not null and contentType is on type
    // application/json.
    if (contentType != null && contentType.contains(jsonHeaders)) {
      // Return a copy of the request with a JSON-encoded body.
      return request.copyWith(body: json.encode(request.body));
    }
    return request;
  }

  Response<BodyType> decodeJson<BodyType, InnerType>(Response response) {
    final contentType = response.headers[contentTypeKey];
    var body = response.body;
    // Check if the contentType is not null and check if contentType contains
    // the jsonHeaders. The decode the response and save to body.
    if (contentType != null && contentType.contains(jsonHeaders)) {
      body = utf8.decode(response.bodyBytes);
    }
    try {
      // Use JSON decoding to convert the string into a mad representation.
      final mapData = json.decode(body) as Map<String, dynamic>;

      // Check if the call has the "totalResults" text. This means it's from the
      // queryRecipes call.
      // This is the list of recipes.
      if (mapData.keys.contains('totalResults')) {
        // Convert the JSON to a spoonacularResults instance using fromJson().
        final spoonacularResults = SpoonacularResults.fromJson(mapData);
        // Convert SpoonacularResults to a list of recipes.
        final recipes = spoonacularResultsToRecipe(spoonacularResults);
        // Create QueryResult with recipes.
        final apiQueryResults = QueryResult(
          offset: spoonacularResults.offset,
          number: spoonacularResults.number,
          totalResults: spoonacularResults.totalResults,
          recipes: recipes,
        );
        // Return a copy of Response with Success result.
        return response.copyWith<BodyType>(
            body: Success(apiQueryResults) as BodyType);
      } else {
        // This is the recipe details.
        // Convert the map to a detailed SpoonacularRecipe.
        final spoonacularRecipe = SpoonacularRecipe.fromJson(mapData);
        // Convert the spoonacularRecipe to a recipe.
        final recipe = spoonacularRecipeToRecipe(spoonacularRecipe);
        // Return a copy of Response with Success that wraps the result.
        return response.copyWith<BodyType>(
          body: Success(recipe) as BodyType,
        );
      }
    } catch(e) {
      // If there is any kind of error, wrap the response with a generic
      // instance of Error.
      chopperLogger.warning(e);
      final error = Error<InnerType>(Exception(e.toString()));
      return Response(response.base, null, error: error);
    }
  }

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    // This returns the decoded JSON response by calling decodeJson(), which was
    // defined above.
    return decodeJson<BodyType, InnerType>(response);
  }
}
