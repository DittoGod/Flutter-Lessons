import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:recipes/network/.env';

import 'package:recipes/data/models/recipe.dart';
import 'package:recipes/mock_service/mock_service.dart';
import 'package:recipes/network/model_response.dart';
import 'package:recipes/network/query_result.dart';
import 'package:recipes/network/service_interface.dart';
import 'package:recipes/network/spoonacular_model.dart';

const String apiKey = env.apiKey;
const String apiUrl = 'https://api.spoonacular.com/';