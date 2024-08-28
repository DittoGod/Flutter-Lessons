import 'package:chopper/chopper.dart';
import 'package:recipes/network/spoonacular_converter.dart';
import 'model_response.dart';
import 'query_result.dart';
import 'service_interface.dart';
import 'package:recipes/data/models/models.dart';
import 'package:recipes/network/env.dart';

part 'spoonacular_service.chopper.dart';

const String apiKey = Env.apiKey;
const String apiUrl = 'https://api.spoonacular.com/';

// @ChopperApi() tells the chopper generator to build a file. This generated
// file will have the same name as this file but with .chopper added to it. It
// will hold the boilerplate code within.
@ChopperApi()
// Define an abstract class. Chopper will create the real class that extends the
// ChopperService and implements the ServiceInterface.
abstract class SpoonacularService extends ChopperService
    implements ServiceInterface {
  /// Get the details of a specific recipe
  @override
  // @Get is an annotation that tells the generator this is a GET request.
  @Get(path: 'recipes/{id}/information?includeNutrition=false')
  Future<RecipeDetailsResponse> queryRecipe(
    // path is the path to the API call. Chopper will append this path to the
    // base URL, which was defined in apiUrl constant in SpoonacularService
    // class.
    @Path('id') String id,
  );

  /// Get a list of recipes that match the query string
  @override
  @Get(path: 'recipes/complexSearch')
  Future<RecipeResponse> queryRecipes(
    @Query('query') String query,
    @Query('offset') int offset,
    @Query('number') int number,
  );

  static SpoonacularService create() {
    // Create a ChopperClient instance.
    final client = ChopperClient(
      // Pass in a base URL using the apiUrl constant.
      baseUrl: Uri.parse(apiUrl),
      // Pass in two interceptors. _addQuery() adds the API key to the query.
      // HttpLoggingInterceptor is a part of Chopper and logs all calls. "While
      // developing it's handy to see traffic between the app and the server."
      interceptors: [_addQuery, HttpLoggingInterceptor()],
      // Set the converter as an instance of SpoonacularConverter.
      converter: SpoonacularConverter(),
      // Use built in JsonConverter to decode any errors.
      errorConverter: const JsonConverter(),
      // Define the services created when the generator script is run.
      services: [_$SpoonacularService()],
    );
    // Return an instance of the generated service.
    return _$SpoonacularService(client);
  }
}

Request _addQuery(Request req) {
  // Creates a map, which contains key-value pairs from the existing Request
  // parameters.
  final params = Map<String, dynamic>.from(req.parameters);
  // Adds the apiKey parameter to the map.
  params['apiKey'] = apiKey;
  // Returns a new copy of the Request with the parameters contained in the map.
  return req.copyWith(parameters: params);
}