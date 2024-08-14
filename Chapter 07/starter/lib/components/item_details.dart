import 'package:flutter/material.dart';
import 'package:yummy/models/cart_manager.dart';
import 'package:yummy/models/restaurant.dart';

class ItemDetails extends StatefulWidget {
  final Item item;
  final CartManager cartManager;
  final void Function() quantityUpdated;

  // The ItemDetails widget takes in the selected item and a CartManager to
  // manage the cart operations. quantityUpdated is a callback that notifies the
  // parent widget that the user updated the quantity.
  const ItemDetails({
    super.key,
    required this.item,
    required this.cartManager,
    required this.quantityUpdated,
  });

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    // Retrieve the textTheme and ensure the text colour matches the surface
    // colour of the colour scheme.
    final textTheme = Theme.of(context).textTheme.apply(
          displayColor: Theme.of(context).colorScheme.onSurface,
        );
    // Retrieve the colorTheme, this ensures the app has a consistent colour
    // theme across all widgets in the app.
    final colorTheme = Theme.of(context).colorScheme;

    // Add uniform padding of 16.0 all around
    return Padding(
      padding: const EdgeInsets.all(16.0),
      // The Wrap widget organizes children in horizontal or vertical runs,
      // adjusting the layout based on space.
      child: Wrap(
        children: [
          // Column widget aligns the child widgets vertically.
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.item.name, style: textTheme.headlineMedium),
              // TODO: Add Liked Badge.
              Text(widget.item.description),
              // TODO: Add Item image.
              // TODO: Add Cart control.
            ],
          ),
        ],
      ),
    );
  }
  // TODO: Create Most Liked Badge.
  // TODO: Create Item Image.
  // TODO: Create Cart control.
}
