import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/custom_dropdown.dart';
import '../colors.dart';

class RecipeList extends StatefulWidget {
  const RecipeList({Key? key}) : super(key: key);

  @override
  State createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  static const String prefSearchKey = 'previousSearches';
  late TextEditingController searchTextController;
  final ScrollController _scrollController = ScrollController();
  List currentSearchList = [];
  int currentCount = 0;
  int currentStartPosition = 0;
  int currentEndPosition = 20;
  int pageCount = 20;
  bool hasMore = false;
  bool loading = false;
  bool inErrorState = false;
  List<String> previousSearches = <String>[];
  // TODO: Add _currentRecipes1

  @override
  void initState() {
    super.initState();
    // TODO: Call loadRecipes()

    getPreviousSearches();
    searchTextController = TextEditingController(text: '');
    _scrollController.addListener(() {
      final triggerFetchMoreSize =
          0.7 * _scrollController.position.maxScrollExtent;

      if (_scrollController.position.pixels > triggerFetchMoreSize) {
        if (hasMore &&
            currentEndPosition < currentCount &&
            !loading &&
            !inErrorState) {
          setState(() {
            loading = true;
            currentStartPosition = currentEndPosition;
            currentEndPosition =
                min(currentStartPosition + pageCount, currentCount);
          });
        }
      }
    });
  }

  // TODO: Add loadRecipes

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  void savePreviousSearches() async {
    // Uses the await keyword to wait for an instance of SharedPreferences.
    final prefs = await SharedPreferences.getInstance();
    // Saves the list of previous searches using the prefSearchKey key.
    prefs.setStringList(prefSearchKey, previousSearches);
  }

  void getPreviousSearches() async {
    // Use the await keyword to wait for an instance of SharedPreferences.
    final prefs = await SharedPreferences.getInstance();
    // Check if a preference for your saved list already exists.
    if (prefs.containsKey(prefSearchKey)) {
      // Get the list of previous searches.
      final searches = prefs.getStringList(prefSearchKey);
      // If the list is not null, set the previous searches, otherwise
      // initialize an empty list.
      if (searches != null) {
        previousSearches = searches;
      } else {
        previousSearches = <String>[];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _buildSearchCard(),
            _buildRecipeLoader(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchCard() {
    return Card(
      elevation: 4,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.search),
              // Add onPressed to handle the tap event.
              onPressed: () {
                // Use the current search text to start a search.
                startSearch(searchTextController.text);
                // Hide the keyboard by using the FocusScope class.
                final currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
            ),
            const SizedBox(
              width: 6.0,
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    // Add a TextField to enter your search queries.
                    child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search',
                      ),
                      autofocus: false,
                      // Set the keyboard action to TextInputAction.done. This
                      // closes the keyboard when the user presses the Done
                      // button.
                      textInputAction: TextInputAction.done,
                      // Start the search when the user finishes entering text.
                      onSubmitted: (value) {
                        startSearch(searchTextController.text);
                      },
                      controller: searchTextController,
                    ),
                  ),
                  // Create a PopupMenuButton to show previous searches.
                  PopupMenuButton<String>(
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: lightGrey,
                    ),
                    // When the user selects an item from previous searches,
                    // start a new search.
                    onSelected: (String value) {
                      searchTextController.text = value;
                      startSearch(searchTextController.text);
                    },
                    itemBuilder: (BuildContext context) {
                      // Build a list of custom drop-down menus (see widgets/
                      // custom_dropdown.dart) to display previous searches.
                      return previousSearches
                          .map<CustomDropdownMenuItem<String>>((String value) {
                        return CustomDropdownMenuItem<String>(
                          text: value,
                          value: value,
                          callback: () {
                            setState(() {
                              // If the X icon is pressed, remove the search
                              // from the previous searches and close the
                              // pop-up menu.
                              previousSearches.remove(value);
                              savePreviousSearches();
                              Navigator.pop(context);
                            });
                          },
                        );
                      }).toList();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void startSearch(String value) {
    // Tell the system to redraw the widgets by calling setState().
    setState(() {
      // Clear the current search list and reset the count, start and end
      // positions.
      currentSearchList.clear();
      currentCount = 0;
      currentEndPosition = pageCount;
      currentStartPosition = 0;
      hasMore = true;
      value = value.trim();
      // Check to make sure the search text hasn’t already been added to the
      // previous search list.
      if (!previousSearches.contains(value)) {
        // Add the search item to the previous search list.
        previousSearches.add(value);
        // Save the new list of previous searches.
        savePreviousSearches();
      }
    });
  }

  // TODO: Replace method
  Widget _buildRecipeLoader(BuildContext context) {
    if (searchTextController.text.length < 3) {
      return Container();
    }
    // Show a loading indicator while waiting for the movies
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  // TODO: Add _buildRecipeCard
}
