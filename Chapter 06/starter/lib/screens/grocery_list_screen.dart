import 'package:flutter/material.dart';
import '../components/grocery_tile.dart';
import '../models/models.dart';
import 'grocery_item_screen.dart';

class GroceryListScreen extends StatelessWidget {
  final GroceryManager manager;

  const GroceryListScreen({
    super.key,
    required this.manager,
  });

  @override
  Widget build(BuildContext context) {
    // Get the list of grocery items from the manager.
    final groceryItems = manager.groceryItems;
    // Apply padding of 16 pixels all around this screen.
    return Padding(
      padding: const EdgeInsets.all(16.0),
      // Add ListView.
      child: ListView.separated(
        // Set the number of items in the list.
        itemCount: groceryItems.length,
        itemBuilder: (context, index) {
          final item = groceryItems[index];
          // TODO: Wrap in a Dismissable
          // TODO: Wrap in an InkWell
          // For each item in the list, get the current item and construct a
          // GroceryTile.
          return GroceryTile(
            key: Key(item.id),
            item: item,
            // Return onComplete when the user taps the checkbox.
            onComplete: (change) {
              // Check if there is a change and update the item’s isComplete
              // status.
              if (change != null) {
                manager.completeItem(index, change);
              }
            },
          );
        },
        // Space each grocery item 16 pixels apart.
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16.0);
        },
      ),
    );
  }
}
