import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../models/grocery_item.dart';

class GroceryTile extends StatelessWidget {
  // You include a GroceryItem to configure the tile.
  final GroceryItem item;
  // onComplete is a callback handler that lets you know whether the user
  // toggled the checkbox on or off.
  final Function(bool?)? onComplete;
  // textDecoration helps style all the Texts.
  final TextDecoration textDecoration;
  // When you initialize a GroceryTile, you check the item to see if the user
  // marked it as complete. If so, you show a strike through the text.
  // Otherwise, you display the text as normal.
  GroceryTile({
    super.key,
    required this.item,
    this.onComplete,
  }) : textDecoration =
            item.isComplete ? TextDecoration.lineThrough : TextDecoration.none;

  @override
  Widget build(BuildContext context) {
    // TODO: Change this Widget
    return Container(
      height: 100.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Add a Row to lay out elements in the horizontal direction.
          Row(
            children: [
              // Add a container widget with the item’s color. This helps to
              // color-code items.
              Container(width: 5.0, color: item.color),
              // Space the elements 16 pixels apart.
              const SizedBox(width: 16.0),
              // Add a Column to lay out elements in the vertical direction.
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Lay out elements spaced 4 pixels apart in the following
                  // order: item name, date and importance.
                  Text(
                    item.name,
                    style: GoogleFonts.lato(
                      decoration: textDecoration,
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  buildDate(),
                  const SizedBox(height: 4.0),
                  buildImportance(),
                ],
              ),
            ],
          ),
          // Add a Row to lay out elements in the horizontal direction.
          Row(
            children: [
              // Then add a Text to display the item’s quantity.
              Text(
                item.quantity.toString(),
                style: GoogleFonts.lato(
                  decoration: textDecoration,
                  fontSize: 21.0,
                ),
              ),
              // Finally, add the checkbox.
              buildCheckbox(),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildImportance() {
    if (item.importance == Importance.low) {
      return Text(
        'Low',
        style: GoogleFonts.lato(
          decoration: textDecoration,
        ),
      );
    } else if (item.importance == Importance.medium) {
      return Text(
        'Medium',
        style: GoogleFonts.lato(
          fontWeight: FontWeight.w800,
          decoration: textDecoration,
        ),
      );
    } else if (item.importance == Importance.high) {
      return Text(
        'High',
        style: GoogleFonts.lato(
          color: Colors.red,
          fontWeight: FontWeight.w900,
          decoration: textDecoration,
        ),
      );
    } else {
      throw Exception('This importance type does not exist');
    }
  }

  Widget buildDate() {
    final dateFormatter = DateFormat('MMMM dd h:mm a');
    final dateString = dateFormatter.format(item.date);
    return Text(
      dateString,
      style: TextStyle(decoration: textDecoration),
    );
  }

  Widget buildCheckbox() {
    return Checkbox(
      // Toggles the checkbox on or off based on item.isComplete.
      value: item.isComplete,
      // Triggers the onComplete callback when the user taps the checkbox.
      onChanged: onComplete,
    );
  }
}
