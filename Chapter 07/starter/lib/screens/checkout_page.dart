// Import necessary material library and manager models.
import 'package:flutter/material.dart';
import 'package:yummy/models/cart_manager.dart';
import 'package:yummy/models/order_manager.dart';

class CheckoutPage extends StatefulWidget {
  // CheckoutPage is a StatefulWidget that requires CartManager to manage and
  // update cart items.
  final CartManager cartManager;

  // Declare a didUpdate() callback to notify when something changes in the
  // cart.
  final Function() didUpdate;

  // Create an onSubmit() callback to notify that the user tapped on the submit
  // button.
  final Function(Order) onSubmit;

  const CheckoutPage({
    super.key,
    required this.cartManager,
    required this.didUpdate,
    required this.onSubmit,
  });

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  // TODO: Add State Properties
  // TODO: Configure Date Format
  // TODO: Configure Time of Day
  // TODO: Set Selected Segment
  // TODO: Build Segmented Control
  // TODO: Build Name TextField
  // TODO: Select Date Picker
  // TODO: Select Time Picker
  // TODO: Build Order Summary
  // TODO: Build Submit Order Button

  @override
  Widget build(BuildContext context) {
    // Retrieve the current theme and apply the colour theme to be consistent
    // throughout the app.
    final textTheme = Theme.of(context).textTheme.apply(
          displayColor: Theme.of(context).colorScheme.onSurface,
        );

    // Create Scaffold widget that sets the AppBar and body.
    return Scaffold(
      // AppBar displays a back button that dismisses the drawer when clicked.
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      // The body sets up padding and uses Column to layout child widgets
      // vertically.
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Oder Details', style: textTheme.headlineSmall),
            // TODO: Add Segmented Control
            // TODO: Add Name TextField
            // TODO: Add Date and Time Picker
            // TODO: Add Oder Summary
            // TODO: Add Submit Order Button
          ],
        ),
      ),
    );
  }
}
