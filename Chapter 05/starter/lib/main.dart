import 'package:flutter/material.dart';

import 'package:yummy/constants.dart';
import 'package:yummy/home.dart';

void main() {
  runApp(const Yummy());
}

class Yummy extends StatefulWidget {
  const Yummy({super.key});

  @override
  State<Yummy> createState() => _YummyState();
}

class _YummyState extends State<Yummy> {
  ThemeMode themeMode = ThemeMode.light;
  ColourSelection colourSelected = ColourSelection.pink;

  void changeThemeMode(bool useLightMode) {
    setState(() {
      themeMode = useLightMode
          ? ThemeMode.light //
          : ThemeMode.dark;
    });
  }

  void changeColor(int value) {
    setState(() {
      colourSelected = ColourSelection.values[value];
    });
  }

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Yummy';

    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false, // Uncomment to remove Debug banner
      themeMode: themeMode,
      theme: ThemeData(
        colorSchemeSeed: colourSelected.colour,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: colourSelected.colour,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: Home(
        appTitle: appTitle,
        changeTheme: changeThemeMode,
        changeColor: changeColor,
        colorSelected: colourSelected,
      ),
    );
  }
}
