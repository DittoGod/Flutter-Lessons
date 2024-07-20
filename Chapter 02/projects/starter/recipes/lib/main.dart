import 'package:flutter/material.dart';

void main() {
  runApp(const RecipesApp());
}

class RecipesApp extends StatelessWidget {
  const RecipesApp({super.key});

  // A widget's build() method is the entry point fo composing together other
  // widgets to make a new widget. The @override annotation tells the Dart
  // analyzer that this method is supposed to replace the default from
  // StatelessWidget.
  @override
  Widget build(BuildContext context) {
    // A theme determines visual aspects like color. The default ThemeData will
    // show the standard Material defaults.
    final ThemeData theme = ThemeData();
    // MaterialApp uses Material Design and is the widget that will be included
    // in RecipesApp.
    return MaterialApp(
      // The Title of the app is a description that the device uses to identify
      // the app. The UI won't display this.
      title: 'Recipe Calculator',
      // By copying the theme and replacing the color scheme with a custom one
      // you are changing the app's colors. Here, by using the special fromSeed
      // constructor, you are generating shades and tones that ThemeData uses to
      // to style widgets following material design specifications.
      theme: theme.copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.greenAccent,
        ),
      ),
      // This still uses the same MyHomePage widget as before, but now, I've
      // updated the title and displayed it on the device.
      home: const MyHomePage(title: 'Recipe Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // A Scaffold provides the high-level structure for a screen. In this case,
    // you're using two properties.
    return Scaffold(
      // AppBar gets a title property by using a Text widget that has a title
      // passed in from home: MyHomePage(title: 'Recipe Calculator') above.
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // body has SafeArea, which keeps the app from getting too close to the
      // operating system interfaces such as the notch or interactive areas like
      // the Home Indicator at the bottom of some iOS screens.
      body: SafeArea(
        // TODO: Replace child: Container()
        // SafeArea has a child widget, which is an empty Container widget.
        child: Container(),
      ),
    );
  }
}
