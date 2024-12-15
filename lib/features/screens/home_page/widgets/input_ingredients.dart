import 'package:flutter/material.dart';
import 'package:food/utils/constants/colors.dart';

class IngredientsInputChip extends StatefulWidget {
  final Function(String) onSubmitted;
  final bool isSelected;
  final String value;

  const IngredientsInputChip({
    Key? key,
    required this.onSubmitted,
    required this.value,
    required this.isSelected,
  }) : super(key: key);

  @override
  _IngredientsInputChipState createState() => _IngredientsInputChipState();
}

class _IngredientsInputChipState extends State<IngredientsInputChip> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return InputChip(
      label: Text(widget.value.isEmpty ? 'Add ingredients' : widget.value),
      backgroundColor: widget.value.isEmpty ? TColors.main : Colors.amber,
      labelStyle: TextStyle(
        fontSize: 13,
        color: widget.value.isNotEmpty ? Colors.black : Color(0xFFC6B9A9),
        fontWeight: FontWeight.w500,
      ),
      showCheckmark: false,
      selected: widget.isSelected,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Add ingredients'),
              content: TextField(
                controller: _controller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(hintText: ''),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    widget.onSubmitted(_controller.text);
                    Navigator.of(context).pop();
                    
                  },
                  child: Text('Submit'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
