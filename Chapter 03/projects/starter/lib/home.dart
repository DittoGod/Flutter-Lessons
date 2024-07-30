import 'package:flutter/material.dart';
import 'package:yummy/components/theme_button.dart';
import 'package:yummy/components/colour_button.dart';
import 'package:yummy/components/category_card.dart';
import 'package:yummy/components/post_card.dart';
import 'package:yummy/models/food_category.dart';
import 'package:yummy/models/post.dart';
import 'package:yummy/constants.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
    required this.changeTheme,
    required this.changeColour,
    required this.colourSelected,
  });

  final void Function(bool useLightMode) changeTheme;
  final void Function(int value) changeColour;
  final ColourSelection colourSelected;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int tab = 0;

  List<NavigationDestination> appBarDestinations = const [
    NavigationDestination(
      icon: Icon(Icons.credit_card),
      label: 'Category',
      selectedIcon: Icon(Icons.credit_card),
    ),
    NavigationDestination(
      icon: Icon(Icons.credit_card),
      label: 'Post',
      selectedIcon: Icon(Icons.credit_card),
    ),
    NavigationDestination(
      icon: Icon(Icons.credit_card),
      label: 'Restaurant',
      selectedIcon: Icon(Icons.credit_card),
    )
  ];

  @override
  Widget build(BuildContext context) {
    final pages = [
      // Center widget ensures the card is laid out on the page.
      Center(
        // Applies a maximum width of 300 pixels to the card widget.
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300),
          // Set CategoryCard widget as the child, and pass the first mock
          // category to be displayed.
          child: CategoryCard(
            category: categories[0],
          ),
        ),
      ),
      Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: PostCard(post: posts[0]),
        ),
      ),
      // TODO: Replace with Restaurant Landscape Card
      Container(color: Colors.blue),
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 4.0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        actions: [
          ThemeButton(changeThemeMode: widget.changeTheme),
          ColourButton(
            changeColour: widget.changeColour,
            colourSelected: widget.colourSelected,
          ),
        ],
      ),

      body: IndexedStack(
        index: tab,
        children: pages,
      ),

      // Assigns NavigationBar to bottomNavigationBar.
      bottomNavigationBar: NavigationBar(
        // Sets the active tab using selectedIndex.
        selectedIndex: tab,
        // Updates the active tab on user selection.
        onDestinationSelected: (index) {
          setState(() {
            tab = index;
          });
        },
        // Defines the list of tabs with appBarDestinations.
        destinations: appBarDestinations,
      ),
    );
  }
}
