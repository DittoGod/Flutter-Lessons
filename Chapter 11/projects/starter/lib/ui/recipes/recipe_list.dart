import 'dart:math';
import 'dart:ui';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:recipes/network/service_interface.dart';
import 'package:recipes/ui/widgets/common.dart';
import 'package:recipes/network/spoonacular_model.dart';

import 'package:recipes/data/models/models.dart';
import 'package:recipes/network/model_response.dart';
import 'package:recipes/network/query_result.dart';
import 'package:recipes/providers.dart';
import 'package:recipes/ui/bookmarks/bookmarks.dart';
import 'package:recipes/ui/recipe_card.dart';
import 'package:recipes/ui/recipes/recipe_details.dart';
import 'package:recipes/ui/theme/colors.dart';
import 'package:recipes/ui/widgets/custom_dropdown.dart';

enum ListType { all, bookmarks }

class RecipeList extends ConsumerStatefulWidget {
  const RecipeList({super.key});

  @override
  ConsumerState createState() => _RecipeListState();
}

class _RecipeListState extends ConsumerState<RecipeList> {
  static const String prefSearchKey = 'previousSearches';

  late TextEditingController searchTextController;
  final ScrollController _scrollController = ScrollController();
  List<Recipe> currentSearchList = [];
  int currentCount = 0;
  int currentStartPosition = 0;
  int currentEndPosition = 20;
  int pageCount = 20;
  bool hasMore = false;
  bool loading = false;
  bool inErrorState = false;
  List<String> previousSearches = <String>[];
  ListType currentType = ListType.all;
  Future<RecipeResponse>? currentResponse;
  bool newDataRequired = true;

  @override
  void initState() {
    super.initState();
    getPreviousSearches();

    searchTextController = TextEditingController(text: '');
    _scrollController.addListener(() {
      if (currentType == ListType.all) {
        final triggerFetchMoreSize =
            0.7 * _scrollController.position.maxScrollExtent;

        if (_scrollController.position.pixels > triggerFetchMoreSize) {
          if (hasMore &&
              currentEndPosition < currentCount &&
              !loading &&
              !inErrorState) {
            setState(
              () {
                loading = true;
                newDataRequired = true;
                currentStartPosition = currentEndPosition;
                currentEndPosition =
                    min(currentStartPosition + pageCount, currentCount);
              },
            );
          }
        }
      }
    });
  }

  @override
  void dispose() {
    searchTextController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void savePreviousSearches() async {
    final prefs = ref.read(sharedPrefProvider);
    prefs.setStringList(prefSearchKey, previousSearches);
  }

  void getPreviousSearches() async {
    final prefs = ref.read(sharedPrefProvider);
    if (prefs.containsKey(prefSearchKey)) {
      final searches = prefs.getStringList(prefSearchKey);
      if (searches != null) {
        previousSearches = searches;
      } else {
        previousSearches = <String>[];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return switch (currentType) {
      ListType.all => buildRecipeList(),
      ListType.bookmarks => buildBookmarkList()
    };
  }

  Widget buildRecipeList() {
    return buildScrollList([
      _buildHeader(),
      _buildTypePicker(),
      _buildSearchCard(),
    ], _buildRecipeLoader(context));
  }

  Widget buildScrollList(List<Widget> topList, Widget bottomWidget) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ...topList,
        ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(
            dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
            physics: const ClampingScrollPhysics(),
          ),
          child: Expanded(
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverPadding(
                  padding: allPadding8,
                  sliver: bottomWidget,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildBookmarkList() {
    return buildScrollList([
      _buildHeader(),
      _buildTypePicker(),
    ], const Bookmarks());
  }

  Widget _buildHeader() {
    return SizedBox(
      height: 160.0,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: lightGreen,
              ),
            ),
            Center(
              child: Image.asset(
                'assets/images/background2.png',
                fit: BoxFit.cover,
              ),
            ),
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
              onPressed: () {
                startSearch(searchTextController.text);
                final currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
            ),
            sizedW8,
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                    ),
                    autofocus: false,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (value) {
                      startSearch(searchTextController.text);
                    },
                    controller: searchTextController,
                  )),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        searchTextController.text = '';
                      });
                    },
                  ),
                  PopupMenuButton<String>(
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: lightGrey,
                    ),
                    onSelected: (String value) {
                      searchTextController.text = value;
                      startSearch(searchTextController.text);
                    },
                    itemBuilder: (BuildContext context) {
                      return previousSearches
                          .map<CustomDropdownMenuItem<String>>((String value) {
                        return CustomDropdownMenuItem<String>(
                          text: value,
                          value: value,
                          callback: () {
                            setState(() {
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
    if (value.isEmpty) {
      return;
    }
    setState(() {
      currentSearchList.clear();
      newDataRequired = true;
      currentCount = 0;
      currentEndPosition = pageCount;
      currentStartPosition = 0;
      hasMore = false;
      value = value.trim();
      if (!previousSearches.contains(value)) {
        previousSearches.add(value);
        savePreviousSearches();
      }
    });
  }

  Sliver _buildRecipeLoader(BuildContext context) {
    if (searchTextController.text.length < 3) {
      return emptySliverWidget;
    }
    return FutureBuilder<RecipeResponse>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return SliverFillRemaining(
              child: Center(
                child: Text(
                  snapshot.error.toString(),
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.3,
                ),
              ),
            );
          }

          loading = false;
          final result = snapshot.data;
          // Hit an error
          if (result is Error) {
            const errorMessage = 'Problems getting data';
            return const SliverFillRemaining(
              child: Center(
                child: Text(
                  errorMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            );
          }
          final query = (result as Success).value as QueryResult;
          inErrorState = false;
          currentCount = query.totalResults;
          hasMore = query.totalResults > (query.offset + query.number);
          currentSearchList.addAll(query.recipes);
          currentEndPosition =
              min(query.totalResults, currentEndPosition + query.number);
          if (currentCount == 0) {
            return const SliverFillRemaining(
              child: Center(
                child: Text(
                  'No Results',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            );
          } else {
            return _buildRecipeList(context, currentSearchList);
          }
        } else {
          if (currentCount == 0) {
            // Show a loading indicator while waiting for the movies
            return const SliverFillRemaining(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return _buildRecipeList(context, currentSearchList);
          }
        }
      },
    );
  }

  Future<RecipeResponse> fetchData() async {
    if (!newDataRequired && currentResponse != null) {
      return currentResponse!;
    }
    newDataRequired = false;

    /*
    // rootBundle is from the services page and allows the loading of data from
    // the assets directory.
    final jsonString = await rootBundle.loadString('assets/recipes1.json');
    // Decode the JSON string and convert it to a SpoonacularResults class.
    final spoonacularResults = SpoonacularResults.fromJson(
      jsonDecode(jsonString),
    );
    // Convert that result into a list of recipes.
    final recipes = spoonacularResultsToRecipe(spoonacularResults);
    // Create a new query result that contains the results.
    final apiQueryResults = QueryResult(
      offset: spoonacularResults.offset,
      number: spoonacularResults.number,
      totalResults: spoonacularResults.totalResults,
      recipes: recipes,
    );
    // Return a Success response.
    currentResponse = Future.value(Success(apiQueryResults));
     */

    final recipeService = ref.watch(serviceProvider);
    currentResponse = recipeService.queryRecipes(
        searchTextController.text.trim(), currentStartPosition, pageCount);

    return currentResponse ?? Future.error('No data found');
  }

  Widget _buildRecipeList(
      BuildContext recipeListContext, List<Recipe> recipes) {
    return SliverLayoutBuilder(
      builder: (BuildContext context, SliverConstraints constraints) {
        final numColumns = max(1, constraints.crossAxisExtent ~/ 264);
        return SliverGrid(
          delegate: SliverChildBuilderDelegate(
            childCount: recipes.length,
            (BuildContext context, int index) {
              return _buildRecipeCard(
                recipeListContext,
                recipes,
                index,
              );
            },
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: numColumns, mainAxisExtent: 264),
        );
      },
    );
  }

  Widget _buildRecipeCard(
    BuildContext topLevelContext,
    List<Recipe> recipes,
    int index,
  ) {
    final recipe = recipes[index];
    return GestureDetector(
      onTap: () {
        Navigator.push(topLevelContext, MaterialPageRoute(
          builder: (context) {
            return RecipeDetails(recipe: recipe);
          },
        ));
      },
      child: recipeCard(recipe),
    );
  }

  Widget _buildTypePicker() {
    return IntrinsicWidth(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SegmentedButton<ListType>(
              segments: const [
                ButtonSegment<ListType>(
                    value: ListType.all, label: Text('All'), enabled: true),
                ButtonSegment<ListType>(
                    value: ListType.bookmarks,
                    label: Text('Bookmarks'),
                    enabled: true),
              ],
              selected: {currentType},
              onSelectionChanged: (Set<ListType> newSelection) {
                setState(() {
                  // By default there is only a single segment that can be
                  // selected at one time, so its value is always the first
                  // item in the selected set.
                  currentType = newSelection.first;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
