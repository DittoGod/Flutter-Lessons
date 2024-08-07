import 'package:flutter/material.dart';

import '../constants.dart';

class ColourButton extends StatelessWidget {
  const ColourButton({
    super.key,
    required this.changeColour,
    required this.colourSelected,
  });

  final void Function(int) changeColour;
  final ColourSelection colourSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(
        Icons.opacity_outlined,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      itemBuilder: (context) {
        return List.generate(
          ColourSelection.values.length,
          (index) {
            final currentColour = ColourSelection.values[index];
            return PopupMenuItem(
              value: index,
              enabled: currentColour != colourSelected,
              child: Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.opacity_outlined,
                      color: currentColour.colour,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(currentColour.label),
                  ),
                ],
              ),
            );
          },
        );
      },
      onSelected: changeColour,
    );
  }
}
