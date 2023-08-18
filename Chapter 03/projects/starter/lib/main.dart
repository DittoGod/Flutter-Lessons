import 'package:flutter/material.dart';
// Imported the FooderlichTheme.
import 'fooderlich_theme.dart';
import 'home.dart';

void main() {
  // Everything in Flutter starts with a widget. runApp() takes in the root
  // widget Fooderlich.
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {
  // Every stateless widget must override the build() method.
  const Fooderlich({super.key});
  @override
  Widget build(BuildContext context) {
    // Defined a variable that holds the theme.
    final theme = FooderlichTheme.dark();
    // TODO: Apply Home widget
    // The Fooderlich widget starts by composing a MaterialApp widget to give it a Material Design system look and feel. See https://material.io for more details about it.
    return MaterialApp(
      theme: theme,
      title: 'Fooderlich',
      home: const Home(),
    );
  }
}
