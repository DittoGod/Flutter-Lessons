import 'package:flutter/material.dart';
// Imported the FooderlichTheme.
import 'fooderlich_theme.dart';

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
      // Added the MaterialApp widget’s theme property.
      theme: theme,
      title: 'Fooderlich',
      // The MaterialApp widget contains a Scaffold widget, which defines the
      // layout and structure of the app. The scaffold has two properties: an
      // appBar and a body. An Appbar’s title contains a Text widget. The body
      // has a Center widget, whose child property is a Text widget.
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Fooderlich',
            // Added AppBar text styling.
            style: theme.textTheme.titleLarge,
          ),
        ),
        body: Center(
          child: Text(
            'Let\'s get cooking ! ',
            // Finally, added body text styling.
            style: theme.textTheme.displayLarge,
          ),
        ),
      ),
    );
  }
}
