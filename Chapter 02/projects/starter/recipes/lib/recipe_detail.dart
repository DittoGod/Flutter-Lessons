import 'package:flutter/material.dart';
import 'recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetail({
    super.key,
    required this.recipe,
  });

  @override
  State<RecipeDetail> createState() {
    return _RecipeDetailState();
  }
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _sliderVal = 1;

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
            // An Expanded widget, which expands to fill the space in a Column.
            // This way, the ingredient list will take up the space not filled
            // by the other widgets.
            Expanded(
              // A ListView, with one row per ingredient.
              child: ListView.builder(
                padding: const EdgeInsets.all(7.0),
                itemCount: widget.recipe.ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  final ingredient = widget.recipe.ingredients[index];
                  // A Text widget that uses string interpolation to populate a
                  // string with runtime values. Use the expression ${expression}
                  // syntax inside the string literal to denote these.
                  // TODO: Add ingredient.quantity
                  return Text(
                    '${ingredient.quantity} ${ingredient.measure} ${ingredient.name}',
                  );
                },
              ),
            ),

            Slider(
              // Use min, max and divisions to define how the Slider moves. In
              // this case, it moves between the values of 1 and 10, with ten
              // discreet stops. That is, it can only have the values 1, 2, 3,
              // 4, 5, 6, 7, 8, 9 or 10.
              min: 1,
              max: 10,
              divisions: 9,
              // label updates as the _sliderVal changes and displays a scaled
              // number of servings.
              label: '${_sliderVal * widget.recipe.servings} servings',
              // The Slider works in double values, so this converts the int
              // variable.
              value: _sliderVal.toDouble(),
              // Conversely, when the Slider changes, this uses round() to
              // convert the double Slider value to an int, then saves it in
              // _sliderVal.
              onChanged: (newValue) {
                setState(() {
                  _sliderVal = newValue.round();
                });
              },
              // This sets the Slider's colours to something more "on brand".
              // The activeColor is the section between the minimum value and
              // the thumb, and the inactiveColor represents the rest.
              activeColor: Colors.green,
              inactiveColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
