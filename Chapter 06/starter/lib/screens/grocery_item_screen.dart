import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../models/models.dart';

class GroceryItemScreen extends StatefulWidget {
  // onCreate is a callback that lets you know when a new item is created.
  final Function(GroceryItem) onCreate;
  // onUpdate is a callback that returns the updated grocery item.
  final Function(GroceryItem) onUpdate;
  // The grocery item that the user clicked.
  final GroceryItem? originalItem;
  // isUpdating determines whether the user is creating or editing an item.
  final bool isUpdating;

  const GroceryItemScreen({
    super.key,
    required this.onCreate,
    required this.onUpdate,
    this.originalItem,
  }) : isUpdating = (originalItem != null);

  @override
  GroceryItemScreenState createState() => GroceryItemScreenState();
}

class GroceryItemScreenState extends State<GroceryItemScreen> {
  // _nameController is a TextEditingController. This controller listens for
  // text changes. It controls the value displayed in a text field.
  final _nameController = TextEditingController();
  // _name stores the name of the item.
  String _name = '';
  // _importance stores the importance level.
  Importance _importance = Importance.low;
  // _dueDate stores the current date and time.
  DateTime _dueDate = DateTime.now();
  // _timeOfDay stores the current time.
  TimeOfDay _timeOfDay = TimeOfDay.now();
  // _currentColor stores the color label.
  Color _currentColor = Colors.green;
  // _currentSliderValue stores the quantity of an item.
  int _currentSliderValue = 0;

  @override
  void initState() {
    super.initState();
    // When the originalItem is not null, the user is editing an existing item.
    // In this case, you must configure the widget to show the item’s values.
    final originalItem = widget.originalItem;
    if (originalItem != null) {
      _nameController.text = originalItem.name;
      _name = originalItem.name;
      _currentSliderValue = originalItem.quantity;
      _importance = originalItem.importance;
      _currentColor = originalItem.color;
      final date = originalItem.date;
      _timeOfDay = TimeOfDay(
        hour: date.hour,
        minute: date.minute,
      );
      _dueDate = date;
    }

    // Adds a listener to listen for text field changes. When the text changes,
    // you set the _name.
    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Add GroceryItemScreen Scaffold
    return Container(color: Colors.orange);
  }

  // TODO: Add buildNameField()

  // TODO: Add buildImportanceField()

  // TODO: ADD buildDateField()

  // TODO: Add buildTimeField()

  // TODO: Add buildColorPicker()

  // TODO: Add buildQuantityField()
}
