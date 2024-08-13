// Import necessary packages and classes.
import 'package:flutter/material.dart';
import 'package:yummy/components/restaurant_item.dart';
import 'package:yummy/models/restaurant.dart';

// Define a new StatefulWidget so it has a mutable state.
class RestaurantPage extends StatefulWidget {
  final Restaurant restaurant;

  // RestaurantPage takes in a restaurant object which contains data such as
  // restaurant info and menu to display on the page.
  const RestaurantPage({super.key, required this.restaurant});

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

// _RestaurantPageState is a class that holds the state for RestaurantPage.
class _RestaurantPageState extends State<RestaurantPage> {
  static const desktopThreshold = 700;
  static const double largeScreenPercentage = 0.9;
  static const double maxWidth = 1000;

  double _calculateConstrainedWidth(double screenWidth) {
    return (screenWidth > desktopThreshold
            ? screenWidth * largeScreenPercentage
            : screenWidth)
        .clamp(0.0, maxWidth);
  }

  int calculateColumnCount(double screenWidth) {
    return screenWidth > desktopThreshold ? 2 : 1;
  }

  CustomScrollView _buildCustomScrollView() {
    return CustomScrollView(
      slivers: [
        _buildSliverAppBar(),
        _buildInfoSection(),
        _buildGridViewSection('Menu'),
      ],
    );
  }

  SliverAppBar _buildSliverAppBar() {
    // The function returns a SliverAppBar widget that creates a collapsible
    // AppBar.
    return SliverAppBar(
      // Keep the AppBar at the top of the view.
      pinned: true,
      // Specify expandedHeight of 300 pixels for maximum height when fully
      // expanded.
      expandedHeight: 300.0,
      // Use a FlexibleSpaceBar for the collapsible part of the AppBar.
      flexibleSpace: FlexibleSpaceBar(
        // Within the FlexibleSpaceBar, set a background widget.
        background: Center(
          // Apply some Padding to create internal spacing for the background.
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 64.0),
            // Arrange elements using a Stack.
            child: Stack(
              children: [
                // Create a container for the backdrop with styling.
                Container(
                  margin: const EdgeInsets.only(bottom: 30.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16.0),
                    // Show the restaurant image as a background using
                    // DecorationImage.
                    image: DecorationImage(
                      image: AssetImage(widget.restaurant.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Place a circular Icon at the bottom left using Positioned
                // widget.
                const Positioned(
                  bottom: 0.0,
                  left: 16.0,
                  child: CircleAvatar(
                    radius: 30,
                    child: Icon(
                      Icons.store,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Create _buildInfoSection() to construct a UI section for the restaurant's
  // details.
  SliverToBoxAdapter _buildInfoSection() {
    // Retrieve the application's text styles for consistent theming.
    final textTheme = Theme.of(context).textTheme;
    // Access restaurant's data passed to the widget.
    final restaurant = widget.restaurant;
    // Create SliverToBoxAdapter to enable a column of text widgets in a
    // sliver-based layout.
    return SliverToBoxAdapter(
      // Apply padding around the column for spacing.
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        // Create a Column widget and align text elements to the start of the
        // column.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the restaurant's name address, rating, and attributes
            // with styled Text widgets.
            Text(restaurant.name, style: textTheme.headlineLarge),
            Text(restaurant.address, style: textTheme.bodySmall),
            Text(restaurant.getRatingAndDistance(), style: textTheme.bodySmall),
            Text(restaurant.attributes, style: textTheme.labelSmall),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(int index) {
    final item = widget.restaurant.items[index];
    return InkWell(
      onTap: () {
        // TODO: Present bottom sheet.
      },
      child: RestaurantItem(item: item),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  // The function _buildGridView() accepts the number of columns as a parameter.
  // This is used to determine the number of columns to display on different
  // devices.
  GridView _buildGrisView(int columns) {
    // GridView.builder() is used for efficient, on-demand building of grid
    // items.
    return GridView.builder(
      // Set up SliverGridDelegateWithFixedCrossAxisCount to define the grid's
      // column count and spacing.
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 3.5,
        crossAxisCount: columns,
      ),
      // Each grid item is built via _buildGridItem(), called within the
      // itemBuilder callback.
      itemBuilder: (context, index) => _buildGridItem(index),
      // Set the number of items to display in the grid.
      itemCount: widget.restaurant.items.length,
      // The shrinkWrap property is enabled, allowing the GridView to size
      // itself according to its children vertically.
      shrinkWrap: true,
      // Set the physics to NeverScrollableScrollPhysics, to prevent scrolling
      // within the grid itself.
      physics: const NeverScrollableScrollPhysics(),
    );
  }

  // Create a section with a title and GridView.
  SliverToBoxAdapter _buildGridViewSection(String title) {
    // Calculate the number of columns based on the screen's width.
    final columns = calculateColumnCount(MediaQuery.of(context).size.width);
    // Build a SliverToBoxAdapter to embed a non-sliver widget.
    return SliverToBoxAdapter(
      // Initialize a container with some padding.
      child: Container(
        padding: const EdgeInsets.all(16.0),
        // Set up a vertical layout with a Column widget.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add a section title using a custom method.
            _sectionTitle(title),
            // Add a GridView with the specified number of columns.
            _buildGrisView(columns),
          ],
        ),
      ),
    );
  }

  // TODO: Replace build method.
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final constrainedWidth = _calculateConstrainedWidth(screenWidth);

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: constrainedWidth,
          child: _buildCustomScrollView(),
        ),
      ),
    );
  }
}
