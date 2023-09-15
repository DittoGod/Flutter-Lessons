import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import 'empty_grocery_screen.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // The main layout structure for GroceryScreen is a scaffold.
    return Scaffold(
      // Adds a floating action button with a + icon. Tapping the button
      // presents the screen to create or add an item. You’ll build this
      // screen later.
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // TODO: Present GroceryItemScreen
        },
      ),
      // Builds the rest of the Grocery screen’s subtree. That’s coming up next!
      body: buildGroceryScreen(),
    );
  }

  Widget buildGroceryScreen() {
    // You wrap your widgets inside a Consumer, which listens for GroceryManager
    // state changes.
    return Consumer<GroceryManager>(
      // Consumer rebuilds the widgets below itself when the grocery manager
      // items changes.
      builder: (context, manager, child) {
        // If there are grocery items in the list, show the GroceryListScreen.
        // You will create this screen soon.
        if (manager.groceryItems.isNotEmpty) {
          // TODO: Add GroceryListScreen
          return Container();
        } else {
          // If there are no grocery items, show the EmptyGroceryScreen.
          return const EmptyGroceryScreen();
        }
      },
    );
  }
}
