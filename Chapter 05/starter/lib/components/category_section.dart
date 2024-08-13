import 'package:flutter/material.dart';
import 'package:yummy/models/food_category.dart';
import 'category_card.dart';

// Categories is a StatelessWidget and requires a list of categories. The
// purpose of this widget is to display a list of various food categories.
class CategorySection extends StatelessWidget {
  final List<FoodCategory> categories;

  const CategorySection({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    // The entire widget is wrapped by Padding widget to ensure a 8.0 pixel
    // space all around.
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // At the top of the column there is a title that displays
          // "Categories".
          const Padding(
            padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
            child: Text(
              'Categories',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          // After the title there is a horizontally scrolling ListView.builder
          // which displays a list of CategoryCard Widgets, each with a height
          // of 200 pixels.
          SizedBox(
            height: 275,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 200,
                  child: CategoryCard(category: categories[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
