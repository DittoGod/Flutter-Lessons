import 'package:flutter/material.dart';
import 'package:yummy/constants.dart';

class ColourButton extends StatelessWidget {
  // Initialises ColourButton with the required callback and colour.
  const ColourButton({
    super.key,
    required this.changeColour,
    required this.colourSelected,
  });

  // Property changeColour is a callback to handle the colour selection, and
  // colourSelected is the currently selected colour.
  final void Function(int) changeColour;
  final ColourSelection colourSelected;

  @override
  Widget build(BuildContext context) {
    // Creates a button that displays a menu.
    return PopupMenuButton(
      icon: Icon(
        Icons.opacity_outlined,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      // Applies rounded corners to the popup menu.
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      itemBuilder: (context) {
        // Creates a list of colour options from ColourSelection.
        return List.generate(ColourSelection.values.length, (index) {
          final currentColour = ColourSelection.values[index];
          // Configures each menu item with an Icon and Text.
          return PopupMenuItem(
            value: index,
            enabled: currentColour != colourSelected,
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Icon(
                    Icons.opacity_outlined,
                    color: currentColour.color,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(currentColour.label),
                )
              ],
            ),
          );
        });
      },
      // Calls changeColour when an item is selected.
      onSelected: changeColour,
    );
  }
}
