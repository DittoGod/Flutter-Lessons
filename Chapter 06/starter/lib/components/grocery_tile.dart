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
      // TODO: Replace this color
      color: Colors.red,
    );
  }

  // TODO: Add BuildImportance()

  // TODO: Add buildDate()

  // TODO: Add buildCheckbox()
}
