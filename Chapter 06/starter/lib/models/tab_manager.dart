import 'package:flutter/material.dart';

// TabManager extends ChangeNotifier. This allows the object to provide change
// notifications to its listeners.
class TabManager extends ChangeNotifier {
  // selectedTab keeps track of which tab the user tapped.
  int selectedTab = 0;

  // goToTab() is a simple function that modifies the current tab index.
  void goToTab(index) {
    // Stores the index of the new tab the user tapped.
    selectedTab = index;
    // Calls notifyListeners() to notify all widgets listening to this state.
    notifyListeners();
  }

  // goToRecipes() is a specific function that sets selectedTab to the Recipes
  // tab, which is at index 1.
  void goToRecipes() {
    selectedTab = 1;
    // Notifies all widgets listening to TabManager that Recipes is the selected
    // tab.
    notifyListeners();
  }
}
