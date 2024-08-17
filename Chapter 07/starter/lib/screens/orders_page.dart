import 'package:flutter/material.dart';
import 'package:yummy/models/order_manager.dart';

class OrdersPage extends StatelessWidget {
  final OrderManager orderManager;

  // It takes an orderManager as a parameter. This is used to retrieve the list
  // of orders.
  const OrdersPage({super.key, required this.orderManager});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.apply(
          displayColor: Theme.of(context).colorScheme.onSurface,
        );
    // Define a Scaffold that has an AppBar.
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('My Oder\'s', style: textTheme.headlineMedium),
      ),
      // Display a ListView.builder() in the body.
      body: ListView.builder(
        // Set the ListView count.
        itemCount: orderManager.totalOrders,
        itemBuilder: (context, index) {
          // For each order, create an OrderTile widget and pass the current
          // order's index.
          return OrderTile(order: orderManager.orders[index]);
        },
      ),
    );
  }
}

// Define OrderTile widget to display the order.
class OrderTile extends StatelessWidget {
  final Order order;

  const OrderTile({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.apply(
          displayColor: Theme.of(context).colorScheme.onSurface,
        );
    // The ListTile wraps a Tile.
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        // The ListTile leading widget is an image with rounded corners.
        child: Image.asset(
          'assets/food/burger.webp',
          width: 50.0,
          height: 50.0,
          fit: BoxFit.cover,
        ),
      ),
      // The title displays a Column to aline the order details vertically
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 10
          Text('Scheduled', style: textTheme.bodyLarge),
          // 11
          Text(order.getFormattedOrderInfo()),
          // 12
          Text('Items: ${order.items.length}'),
        ],
      ),
    );
  }
}
