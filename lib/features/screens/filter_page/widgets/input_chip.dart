import 'package:flutter/material.dart';
import 'package:food/utils/constants/colors.dart';

class NumberInputChip extends StatefulWidget {
  final String label;
  final Function(String) onSubmitted;
  final bool isSelected;
  final String value;

  const NumberInputChip({
    Key? key,
    required this.label,
    required this.onSubmitted,
    this.isSelected = false,
    this.value = '',
  }) : super(key: key);

  @override
  _NumberInputChipState createState() => _NumberInputChipState();
}

class _NumberInputChipState extends State<NumberInputChip> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return InputChip(
      label: Text(widget.value.isEmpty
          ? widget.label
          : '${widget.label}: ${widget.value}'),
      backgroundColor: TColors.main,
      selectedColor: TColors.secondry,
      labelStyle: TextStyle(
        fontSize: 13,
        color: widget.isSelected ? Colors.black : Color(0xFFC6B9A9),
        fontWeight: FontWeight.w500,
      ),
      showCheckmark: false,
      selected: widget.isSelected,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(widget.label),
              content: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Enter value'),
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
