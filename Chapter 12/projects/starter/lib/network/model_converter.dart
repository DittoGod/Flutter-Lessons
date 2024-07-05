import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'model_response.dart';
import 'recipe_model.dart';

// Use ModelConverter to implement the Chopper Converter abstract class.
class ModelConverter implements Converter {
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
    // Extract the content type from the request headers.
    final contentType = request.headers[contentTypeKey];
    // Confirm contentType is of type application/json.
    if (contentType != null && contentType.contains(jsonHeaders)) {
      // Make a copy of the request with a JSON-encoded body.
      return request.copyWith(body: json.encode(request.body));
    }
    return request;
  }

  Response<BodyType> decodeJson<BodyType, InnerType>(Response response) {
    final contentType = response.headers[contentTypeKey];
    var body = response.body;
    // Check that you’re dealing with JSON and decode the response into a
    // string named body.
    if (contentType != null && contentType.contains(jsonHeaders)) {
      body = utf8.decode(response.bodyBytes);
    }
    try {
      // Use JSON decoding to convert that string into a map representation.
      final mapData = json.decode(body);
      // When there’s an error, the server returns a field named status. Here,
      // you check to see if the map contains such a field. If so, you return a
      // response that embeds an instance of Error.
      if (mapData['status'] != null) {
        return response.copyWith<BodyType>(
            body: Error(Exception(mapData['status'])) as BodyType);
      }
      // Use APIRecipeQuery.fromJson() to convert the map into the model class.
      final recipeQuery = APIRecipeQuery.fromJson(mapData);
      // Return a successful response that wraps recipeQuery.
      return response.copyWith<BodyType>(
          body: Success(recipeQuery) as BodyType);
    } catch (e) {
      // If you get any other kind of error, wrap the response with a generic
      // instance of Error.
      chopperLogger.warning(e);
      return response.copyWith<BodyType>(
          body: Error(e as Exception) as BodyType);
    }
  }

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    // This simply calls decodeJson, which you defined earlier.
    return decodeJson<BodyType, InnerType>(response);
  }
}
