import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:yummy/components/cart_control.dart';
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
              const SizedBox(height: 16.0),
              _mostLikedBadge(colorTheme),
              const SizedBox(height: 16.0),
              Text(widget.item.description),
              const SizedBox(height: 16.0),
              _itemImage(widget.item.imageUrl),
              const SizedBox(height: 16.0),
              _addToCartControl(widget.item),
            ],
          ),
        ],
      ),
    );
  }

  // Define a method _mostLikedBadge(), which takes in a ColorScheme. This
  // method will create a badge to indicate whether an item is most liked.
  Widget _mostLikedBadge(ColorScheme colorTheme) {
    // The Align widget is used to align the badge within the parent widget.
    return Align(
      // Align the widget center-left.
      alignment: Alignment.centerLeft,
      // A Container is used to apply padding and colour.
      child: Container(
        padding: const EdgeInsets.all(4.0),
        color: colorTheme.onPrimary,
        // A Text widget is used to display the content of the badge.
        child: const Text('#1 Most Liked'),
      ),
    );
  }

  // _itemImage() takes in an imageUrl.
  Widget _itemImage(String imageUrl) {
    // Apply a Container to style the image, adding a fixed height and rounded
    // corners.
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        // Set the background image.
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // _addToCartControl takes in the selected Item object.
  Widget _addToCartControl(Item item) {
    // It returns a CartControl widget.
    return CartControl(
      // The addToCart() callback function will return the item quantity and
      // create a new CartItem. A CartItem requires a uniquely generated id,
      // item name, price, and the quantity selected.
      addToCart: (number) {
        const uuid = Uuid();
        final uniqueId = uuid.v4();
        final cartItem = CartItem(
          id: uniqueId,
          name: item.name,
          price: item.price,
          quantity: number,
        );
        // Update the state by adding the new cart item managed by CartManager.
        setState(() {
          widget.cartManager.addItem(cartItem);
          // Invoke the callback to notify the parent widget that the quantity
          // has been updated.
          widget.quantityUpdated();
        });
        // close the bottom sheet.
        Navigator.pop(context);
      },
    );
  }
}
