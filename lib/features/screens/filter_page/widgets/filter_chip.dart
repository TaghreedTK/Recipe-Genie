// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:food/utils/constants/colors.dart';

class FilterChips extends StatelessWidget {
  const FilterChips({
    Key? key,
    required this.selectedItems,
    required this.onSelected,
    required this.filter,
    required this.Ask,
  }) : super(key: key);

  final List<String> selectedItems;
  final void Function(String value, bool selected) onSelected;
  final List<String> filter;
  final String Ask;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0, bottom: 10),
            child: Text(
              Ask,
              style: TextStyle(
                color: TColors.textPrimary,
                fontSize: 15,
                height: 1.2,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Wrap(
              clipBehavior: Clip.none,
              spacing: 3.0,
              runSpacing: 0.0,
              children: filter.map((value) {
                return ChoiceChip(
                  elevation: 0,
                  clipBehavior: Clip.none,
                  surfaceTintColor: TColors.main,
                  label: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 4.0, vertical: 0.0), // Adjust as needed
                    child: Text(value),
                  ),
                  backgroundColor: TColors.main,
                  selectedColor: TColors.secondry,
                  labelStyle: TextStyle(
                    fontSize: 13,
                    color: selectedItems.contains(value)
                        ? Colors.black
                        : Color(0xFFC6B9A9),
                    fontWeight: FontWeight.w500,
                  ),
                  showCheckmark: false,
                  selected: selectedItems.contains(value),
                  onSelected: (bool selected) {
                    onSelected(value, selected);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide.none,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
