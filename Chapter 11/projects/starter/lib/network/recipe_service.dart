import 'dart:developer';
import 'package:http/http.dart';
import 'env.dart';

String apiKey = Env.apiKey;
String apiId = Env.appID;
const String apiUrl = 'https://api.edamam.com/search';

class RecipeService {
  // getData() returns a Future (with an upper case “F”) because an API’s
  // returned data type is determined in the future (lower case “f”). async
  // signifies this method is an asynchronous operation.
  Future getData(String url) async {
    log('$apiKey \n$apiId');
    // response doesn’t have a value until await completes. Response and get()
    // are from the HTTP package. get() fetches data from the provided url.
    final response = await get(Uri.parse(url));
    // A statusCode of 200 means the request was successful.
    if (response.statusCode == 200) {
      // You return the results embedded in response.body.
      return response.body;
    } else {
      // Otherwise, you have an error — print the statusCode to the console.
      log(response.body);
    }
  }
// TODO: Add getRecipes
}
