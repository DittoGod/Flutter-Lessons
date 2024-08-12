import 'package:flutter/material.dart';
import 'package:yummy/api/mock_yummy_service.dart';

class ExplorePage extends StatelessWidget {
  // Create a MockYummyService, to mock server responses
  final mockService = MockYummyService();

  ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Add ListView Future Builder
    // Display a placeholder text.
    return const Center(
      child: Text(
        'Explore Page Setup',
        style: TextStyle(fontSize: 32.0),
      ),
    );
  }
}
