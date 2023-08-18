import 'package:flutter/material.dart';

// Your new class extends StatefulWidget.
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  // TODO: Add state variables and functions
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fooderlich',
          // The AppBar style now reads: Theme.of(context).textTheme.headline6
          // instead of: theme.textTheme.headline6. Theme.of(context) returns
          // the nearest Theme in the widget tree. If the widget has a defined
          // Theme, it returns that. Otherwise, it returns the app’s theme.
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      // TODO: Show selected tab
      body: Center(
        child: Text(
          'Let\'s get cooking ! ',
          // As with the AppBar, you’ve also updated the Text style to use the
          // Theme.of(context).
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      // Defined a BottomNavigationBar.
      bottomNavigationBar: BottomNavigationBar(
        // Set the selection color of an item when tapped.
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        // TODO: Set selected tab bar
        // Defined three bottom navigation tab bar items.
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Card',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Card2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Card3',
          ),
        ],
      ),
    );
  }
}
