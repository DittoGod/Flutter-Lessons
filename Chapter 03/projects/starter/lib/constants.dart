import 'package:flutter/material.dart';

enum ColourSelection {
  // Structured colour options. The name listed "deepPurple" is what will be
  // displayed.
  deepPurple('Deep Purple', Colors.deepPurple),
  purple('Purple', Colors.purple),
  indigo('Indigo', Colors.indigo),
  blue('Blue', Colors.blue),
  teal('Teal', Colors.teal),
  green('Green', Colors.green),
  yellow('Yellow', Colors.yellow),
  orange('Orange', Colors.orange),
  deepOrange('Deep Orange', Colors.deepOrange),
  pink('Pink', Colors.pink);

  // Each has a label and a colour object.
  const ColourSelection(
    this.label,
    this.color,
  );

  final String label;
  final Color color;
}
