import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

class AddMealPlanDialog extends StatefulWidget {
  final String label;
  final Function(int date, int slot, int position) onSubmitted;

  AddMealPlanDialog({required this.label, required this.onSubmitted});

  @override
  _AddMealPlanDialogState createState() => _AddMealPlanDialogState();
}

class _AddMealPlanDialogState extends State<AddMealPlanDialog> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _slotController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.label),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _dateController,
            keyboardType: TextInputType.datetime,
            inputFormatters: [DateInputFormatter()],
            decoration: InputDecoration(
              hintText: 'Enter date (yyyy-MM-dd)',
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: _slotController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Enter slot',
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: _positionController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Enter position',
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            final dateInput = _dateController.text;
            final slotInput = _slotController.text;
            final positionInput = _positionController.text;

            // Convert date to Unix timestamp
            final date = DateFormat('yyyy-MM-dd')
                    .parse(dateInput)
                    .millisecondsSinceEpoch ~/ 1000;
            final slot = int.tryParse(slotInput) ?? 0;
            final position = int.tryParse(positionInput) ?? 0;

            widget.onSubmitted(date, slot, position);
            Navigator.of(context).pop();
          },
          child: Text('Submit'),
        ),
      ],
    );
  }
}

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;

    if (text.length == 4 || text.length == 7) {
      if (text.length > oldValue.text.length) {
        return TextEditingValue(
          text: '$text-',
          selection: TextSelection.collapsed(offset: text.length + 1),
        );
      }
    }

    return newValue;
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Meal Planner'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AddMealPlanDialog(
                    label: 'Add Meal Plan',
                    onSubmitted: (date, slot, position) {
                      print('Date: $date, Slot: $slot, Position: $position');
                      // Call your addToMealPlan function here
                    },
                  );
                },
              );
            },
            child: Text('Add Meal Plan'),
          ),
        ),
      ),
    );
  }
}
