import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/data/repositories/memory_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:recipes/data/models/current_recipe_data.dart';
import 'package:recipes/network/service_interface.dart';

// Define a provider for Shared Preferences.
final sharedPrefProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

// Define a ChangeNotifierProvider for the MemoryRepository.
final repositoryProvider =
    NotifierProvider<MemoryRepository, CurrentRecipeData>(() {
  return MemoryRepository();
});

// Define a provider for ServiceInterface. This will allow for the substitution
// of any ServiceInterface class.
final serviceProvider = Provider<ServiceInterface>((ref) {
  throw UnimplementedError();
});
