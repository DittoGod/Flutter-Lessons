import 'package:flutter/material.dart';
import 'recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetail({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  State<RecipeDetail> createState() {
    return _RecipeDetailState();
  }
}

class _RecipeDetailState extends State<RecipeDetail> {
  // TODO: Add _sliderVal here

  @override
  Widget build(BuildContext context) {
    // Scaffold defines the pages general structure.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      // In the body, there's a SafeArea, a Column with some SizedBox and Text
      // widget.
      body: SafeArea(
        // SafeArea keeps the app from getting too close to the operating system
        // interfaces, such as the notch or the interactive are of most iPhones.
        child: Column(
          children: <Widget>[
            // One new thing is the SizedBox around the Image, which defines
            // resizable bounds for the image. Here, the height is fixed at 300
            // but the width will adjust to fit the aspect ratio. The unit of
            // measurement if Flutter is logical pixels.
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.recipe.imageUrl),
              ),
            ),
            // There is a spacer sized box.
            const SizedBox(height: 4.0),
            // The Text for the label has a style that's a little different than
            // the main Card, to show how much customizability is available.
            Text(
              widget.recipe.label,
              style: const TextStyle(fontSize: 18.0),
            ),
            // TODO: Add Expand

            // TODO: Add Slider() here
          ],
        ),
      ),
    );
  }
}
