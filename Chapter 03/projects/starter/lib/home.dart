import 'package:flutter/material.dart';
import 'package:yummy/components/theme_button.dart';
import 'package:yummy/components/colour_button.dart';
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
    // TODO: Define pages

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

      // TODO: Switch between pages
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'You Hungry?😋',
          style: Theme.of(context).textTheme.displayLarge,
        ),
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
