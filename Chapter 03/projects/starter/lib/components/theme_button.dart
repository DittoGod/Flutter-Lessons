import 'package:flutter/material.dart';

class ThemeButton extends StatelessWidget {
  // The ThemeButton widget is initialised with a constructor requiring a
  // function changeThemeMode parameter.
  const ThemeButton({
    super.key,
    required this.changeThemeMode,
  });

  // changeThemeMode is a callback function passed as a parameter to be called
  // when the user pressed the button. This function notifies the parent widget
  // about the brightness change, enabling it to adjust the theme accordingly.
  final Function changeThemeMode;

  @override
  Widget build(BuildContext context) {
    // isBright is a Boolean that checks whether the current theme brightness is
    // light
    final isBright = Theme.of(context).brightness == Brightness.light;
    // An IconButton widget that will display light or dark mode icon based on
    // the isBright Boolean.
    return IconButton(
      onPressed: () => changeThemeMode(!isBright),
      icon: isBright
          ? const Icon(Icons.dark_mode_outlined)
          : const Icon(Icons.light_mode_outlined),
    );
  }
}
