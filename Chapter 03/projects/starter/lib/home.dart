import 'package:flutter/material.dart';
import 'package:yummy/components/theme_button.dart';
import 'package:yummy/components/colour_button.dart';
import 'package:yummy/constants.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
    required this.changeTheme,
    required this.changeColour,
    required this.colourSelected,
  });

  final void Function(bool useLightMode) changeTheme;
  final void Function(int value) changeColour;
  final ColourSelection colourSelected;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // TODO: Track current Tab

  // TODO: Define TabBar destinations

  @override
  Widget build(BuildContext context) {
    // TODO: Define pages

    return Scaffold(
      appBar: AppBar(
        elevation: 4.0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        actions: [
          ThemeButton(changeThemeMode: widget.changeTheme),
          ColourButton(
            changeColour: widget.changeColour,
            colourSelected: widget.colourSelected,
          ),
        ],
      ),
      // TODO: Switch between pages
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'You Hungry?😋',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
      // TODO: Add bottom navigation bar.
    );
  }
}
