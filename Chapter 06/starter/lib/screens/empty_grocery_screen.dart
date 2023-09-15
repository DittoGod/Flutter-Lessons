import 'package:flutter/material.dart';

class EmptyGroceryScreen extends StatelessWidget {
  const EmptyGroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Padding: Adds 30 pixels on all sides.
    return Padding(
      padding: const EdgeInsets.all(30.0),
      // Center: Places all the other widgets in the center.
      child: Center(
        // Column: Handles the vertical layouts of the other widgets.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TODO: Add empty image
            // TODO: Add empty screen title
            // TODO: Add empty screen subtitle
            // TODO: Add browse recipes button
          ],
        ),
      ),
    );
  }
}
