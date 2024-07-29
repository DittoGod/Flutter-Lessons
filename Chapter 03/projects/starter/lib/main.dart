import 'package:flutter/material.dart';
import 'constants.dart';

void main() {
  // Widget Initialisation: Every journey with Flutter commences with a widget.
  // The runApp() function initialises the app by accepting the root widget, in
  // this case an instance of Yummy.
  runApp(const Yummy());
}

class Yummy extends StatefulWidget {


  const Yummy({super.key});

  @override
  State<Yummy> createState() => _YummyState();
}

class _YummyState extends State<Yummy> {
  // Manual theme to toggle
  ThemeMode themeMode = ThemeMode.light;

  ColourSelection colorSelected = ColourSelection.pink;

  void changeTheme(bool useLightMode) {
    setState(() {
      // Update theme mode based on user selection.
      themeMode = useLightMode
          ? ThemeMode.light
          : ThemeMode.dark;
    });
  }

  void changeColour(int value) {
    setState(() {
      // Update theme colour based on user selection.
      colorSelected = ColourSelection.values[value];
    });
  }

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Yummy';

    // TODO: Setup default theme

    // Every Widget starts by composing a MaterialApp widget to give it a
    // Material Design system look and feel.
    return MaterialApp(
      title: appTitle,
      //debugShowCheckedModeBanner: false, // Uncomment to remove Debug banner

      themeMode: themeMode,
      theme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),

      // TODO: Apply Home widget

      // Scaffold defines the app's visual structure, containing an AppBar and a
      // body for starts.
      home: Scaffold(
        appBar: AppBar(
          // TODO: Add action buttons
          elevation: 4.0,
          title: const Text(
            appTitle,
            style: TextStyle(fontSize: 24.0),
          ),
        ),
        body: const Center(
          child: Text(
            'You Hungry?😋',
            style: TextStyle(fontSize: 30.0),
          ),
        ),
      ),
    );
  }
}
