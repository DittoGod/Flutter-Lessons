// Import necessary material library and manager models.
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yummy/models/cart_manager.dart';
import 'package:yummy/models/order_manager.dart';

class CheckoutPage extends StatefulWidget {
  // CheckoutPage is a StatefulWidget that requires CartManager to manage and
  // update cart items.
  final CartManager cartManager;

  // Declare a didUpdate() callback to notify when something changes in the
  // cart.
  final Function() didUpdate;

  // Create an onSubmit() callback to notify that the user tapped on the submit
  // button.
  final Function(Order) onSubmit;

  const CheckoutPage({
    super.key,
    required this.cartManager,
    required this.didUpdate,
    required this.onSubmit,
  });

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  // Declare a mapping from integer to delivery type.
  final Map<int, Widget> myTabs = const <int, Widget>{
    0: Text('Delivery'),
    1: Text('Self Pick-Up'),
  };

  // Determines whether the user selected Delivery of Self Pick-Up.
  Set<int> selectedSegment = {0};

  // selectedTime stores the selected time.
  TimeOfDay? selectedTime;

  // selectedDate stores the selected date.
  DateTime? selectedDate;

  // _firstDate and _lastDate determines the date range the user can select
  // from.
  final DateTime _firstDate = DateTime(DateTime.now().year - 2);
  final DateTime _lastDate = DateTime(DateTime.now().year + 1);

  // _nameController refers to the TextField used to enter the customers name.
  final TextEditingController _nameController = TextEditingController();

  // The function takes on optional DateTime as a parameter.
  String formatDate(DateTime? dateTime) {
    // If the dateTime id null, return the text 'Select Date', to ask the user
    // to select a date.
    if (dateTime == null) {
      return 'Select Date';
    }
    // If a dateTime exists, return the formatted date.
    final formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(dateTime);
  }

  // This function takes in TimeOfDay as a parameter
  String formatTimeOfDay(TimeOfDay? timeOfDay) {
    // If the timeOfDay is null return 'Select Time' to indicate to the user to
    // select a time.
    if (timeOfDay == null) {
      return 'Select Time';
    }
    // Otherwise return the formatted time.
    final hour = timeOfDay.hour.toString().padLeft(2, '0');
    final minute = timeOfDay.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  void onSegmentSelected(Set<int> segmentIndex) {
    setState(() {
      selectedSegment = segmentIndex;
    });
  }

  Widget _buildOderSegmentedType() {
    // Returns a SegmentedButton widget.
    return SegmentedButton(
      // Hides the icons in the SegmentedButton.
      showSelectedIcon: false,
      // Define two button segments for the user to choose. Delivery or Pickup.
      segments: const [
        ButtonSegment(
          value: 0,
          label: Text('Delivery'),
          icon: Icon(Icons.pedal_bike),
        ),
        ButtonSegment(
          value: 1,
          label: Text('Pickup'),
          icon: Icon(Icons.local_mall),
        ),
      ],
      // Set the selected segment.
      selected: selectedSegment,
      // When a user makes a choice update the selected segment.
      onSelectionChanged: onSegmentSelected,
    );
  }

  Widget _buildTextField() {
    // The function returns a TextField widget.
    return TextField(
      // TextField uses the controller to manage the text being edited. It
      // allows reading, updating or listening to changes of the current value
      // of the current TextField.
      controller: _nameController,
      // Add a placeholder text, to give the user some context about what to
      // type.
      decoration: const InputDecoration(labelText: 'Contact Name'),
    );
  }

  // _selectDate is an asynchronous function that takes BuildContext as a
  // parameter.
  void _selectDate(BuildContext context) async {
    // showDatePicker open the date picker dialog. The function awaits for the
    // user to pick or cancel the date picker stores it in the picked property.
    final picked = await showDatePicker(
      // Pass in the context to display the dialog.
      context: context,
      // initialDate sets the selected date or defaults to the current date.
      initialDate: selectedDate ?? DateTime.now(),
      // Define the date range the user can pick from.
      firstDate: _firstDate,
      lastDate: _lastDate,
    );
    // If the picked date is not null and is different from the currently
    // selected date, update the selectedDate and trigger a rebuild of the
    // widget to reflect the ne selection.
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // _selectedTime() is an asynchronous function that takes BuildContext as a
  // parameter.
  void _selectTime(BuildContext context) async {
    // showTimePicker() opens the time picker dialog. The function awaits the
    // user to pick or cancel the time picker and stores it in the picked
    // property.
    final picked = await showTimePicker(
      // Pass in the context to display the dialog.
      context: context,
      // initialEntryMode sets the mode to enter the time. input mode allows the
      // user to enter values via the keyboard.
      initialEntryMode: TimePickerEntryMode.input,
      // Set the initialTime to the selectedTime, if null, default to the
      // current time.
      initialTime: selectedTime ?? TimeOfDay.now(),
      // The builder() function builds the time picker. MediaQuery forces it to
      // always show the 24-hour time format, regardless of the device default
      // setting.
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );
    // If the time picked is not null and is different from the selectedTime,
    // update the selectedTome and trigger a rebuild of the widget to reflect
    // the new selection.
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  // _buildOrderSummary() takes a BuildContext as a parameter.
  Widget _buildOrderSummary(BuildContext context) {
    // Retrieve the color theme for consistency throughout the app.
    final colorTheme = Theme.of(context).colorScheme;

    // Return an Expanded widget that allows ListView to use all available space
    // in its parent widget.
    return Expanded(
      // Use ListView.builder() to create a scrollable list of items.
      child: ListView.builder(
        // Set item count
        itemCount: widget.cartManager.items.length,
        itemBuilder: (context, index) {
          // Build each item by retrieving the menu item for a given index.
          final item = widget.cartManager.itemAt(index);
          // Construct a ListTile to display the menu item selected, display
          // quantity and the total price for each item.
          return Dismissible(
            // Key is used to uniquely identify each Dismissible item in the
            // list.
            key: Key(item.id),
            // Configure the dismiss direction swiping from right to left.
            direction: DismissDirection.endToStart,
            // Set an empty background container
            background: Container(),
            // Set a secondary background and show a delete (trash) icon aligned
            // to the right end.
            secondaryBackground: const SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Icon(Icons.delete)],
              ),
            ),
            // When onDismissed() is trigger, call setState() to remove the item
            // from the cart.
            onDismissed: (direction) {
              setState(() {
                widget.cartManager.removeItem(item.id);
              });
              // Invoke didUpdate() to notify the parent to refresh the UI or
              // perform other actions.
              widget.didUpdate;
            },
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  border: Border.all(color: colorTheme.primary, width: 2.0),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  child: Text('x${item.quantity}'),
                ),
              ),
              title: Text(item.name),
              subtitle: Text('Price: £${item.price}'),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSubmitButton() {
    // The function returns an ElevatedButton widget.
    return ElevatedButton(
      // When the cart is empty, onPressed() disables the button by setting it
      // to null.
      onPressed: widget.cartManager.isEmpty
          ? null
          // If the cart is not empty, onPressed() retrieves all user data.
          : () {
              final selectedSegment = this.selectedSegment;
              final selectedTime = this.selectedTime;
              final selectedDate = this.selectedDate;
              final name = _nameController.text;
              final items = widget.cartManager.items;
              // Create an Order object.
              final order = Order(
                selectedSegment: selectedSegment,
                selectedTime: selectedTime,
                selectedDate: selectedDate,
                name: name,
                items: items,
              );
              // Reset the cart.
              widget.cartManager.resetCart();
              // Submit the Oder.
              widget.onSubmit(order);
            },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        // Show the total cost of the Order.
        child: Text(
          'Submit Order - £${widget.cartManager.totalCost.toStringAsFixed(2)}',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve the current theme and apply the colour theme to be consistent
    // throughout the app.
    final textTheme = Theme.of(context).textTheme.apply(
          displayColor: Theme.of(context).colorScheme.onSurface,
        );

    // Create Scaffold widget that sets the AppBar and body.
    return Scaffold(
      // AppBar displays a back button that dismisses the drawer when clicked.
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      // The body sets up padding and uses Column to layout child widgets
      // vertically.
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Oder Details', style: textTheme.headlineSmall),
            const SizedBox(height: 16.0),
            _buildOderSegmentedType(),
            const SizedBox(height: 16.0),
            _buildTextField(),
            // Add a 16.0 vertical space from the widget on top.
            const SizedBox(height: 16.0),
            //Use a Row to display the two buttons horizontally.
            Row(
              children: [
                TextButton(
                  // Tapping the button presents the date picker.
                  onPressed: () => _selectDate(context),
                  // The first TextButton displays 'Select Date' or the
                  // currently selected date.
                  child: Text(formatDate(selectedDate)),
                ),
                TextButton(
                  // Tapping the button presents the time picker.
                  onPressed: () => _selectTime(context),
                  // The second TextButton displays 'Select Time' or the
                  // currently selected time.
                  child: Text(formatTimeOfDay(selectedTime)),
                ),
              ],
            ),
            // Add 16.0 vertical spacing between the widget below.
            const SizedBox(height: 16.0),
            const Text('Order Summery'),
            _buildOrderSummary(context),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }
}
