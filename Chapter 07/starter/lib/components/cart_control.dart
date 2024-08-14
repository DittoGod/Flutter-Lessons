import 'package:flutter/material.dart';

// Define a StatefulWidget called CartControl.
class CartControl extends StatefulWidget {
  // Define an addToCart() callback function, which returns an integer to
  // specify the number of items in the cart.
  final void Function(int) addToCart;

  const CartControl({super.key, required this.addToCart});

  // Link this widget to its state _CartControlState.
  @override
  State<CartControl> createState() => _CartControlState();
}

// Define the CartControl state class.
class _CartControlState extends State<CartControl> {
  // _cartNumber is a private state variable used to keep track of the quantity
  // of items to be added to the cart. The default value is 1.
  int _cartNumber = 1;

  @override
  Widget build(BuildContext context) {
    // Within build() method, retrieve the colorScheme for consistency.
    final colorScheme = Theme.of(context).colorScheme;
    // Return a Row widget to layout children horizontally.
    return Row(
      // Use MainAxisAlignment.spaceBetween to space the children evenly.
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // Add the cart components.
      children: [
        _buildMinusButton(),
        _buildCartNumberContainer(colorScheme),
        _buildPlusButton(),
        const Spacer(),
        _buildAddToCartButton(),
      ],
    );
  }

  // Create a button to decrease the number of items in the cart.
  Widget _buildMinusButton() {
    // Initialise an IconButton with the remove symbol that renders like a minus
    // sign.
    return IconButton(
      // Configures the onPressed() callback to trigger a setState to update the
      // UI.
      onPressed: () {
        setState(() {
          // Decrements _cartNumber by 1 if it's greater that 1 preventing it
          // from going below 1.
          if (_cartNumber > 1) {
            _cartNumber--;
          }
        });
      },
      // Provides a tooltip for accessibility and user guidance.
      tooltip: 'Decrease Cart Count',
      icon: const Icon(Icons.remove),
    );
  }

  // The method takes a ColorScheme to style the widget.
  Widget _buildCartNumberContainer(ColorScheme colorScheme) {
    // It returns a Container with spacing and alignment.
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      color: colorScheme.onPrimary,
      // Displays the _cartNumber as a text.
      child: Text(_cartNumber.toString()),
    );
  }

  Widget _buildPlusButton() {
    return IconButton(
      onPressed: () {
        setState(() {
          _cartNumber++;
        });
      },
      tooltip: 'Increase Cart Count',
      icon: const Icon(Icons.add),
    );
  }

  Widget _buildAddToCartButton() {
    // Initialise a FilledButton which is a button that fills the button's
    // background.
    return FilledButton(
      // When the user presses the button, trigger the addToCart() callback and
      // pass the number of items selected by the user.
      onPressed: () {
        widget.addToCart(_cartNumber);
      },
      // The button displays the text 'Add to Cart'.
      child: const Text('Add to Cart'),
    );
  }
}
