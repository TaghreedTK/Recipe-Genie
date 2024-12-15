import 'package:flutter/material.dart';
import 'package:food/cubits/filter_cubit/filter_cubit.dart';
import 'package:food/features/screens/filter_page/filter_dishes.dart';
import 'package:food/features/screens/filter_page/widgets/filter_chip%20_single.dart';
import 'package:food/features/screens/filter_page/widgets/filter_chip.dart';
import 'package:food/features/screens/filter_page/widgets/input_chip.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// Import the new file

import 'package:food/utils/constants/colors.dart';

class FilterContainer extends StatefulWidget {
  const FilterContainer({super.key});

  @override
  State<FilterContainer> createState() => _FilterContainerState();
}

class _FilterContainerState extends State<FilterContainer> {
  final List<String> diet = const [
    'Vegan',
    'Vegetarian',
    'Pescetarian',
    'Keto',
    'Paleo',
    'Gluten Free',
    'Lacto-Vegetarian',
    'Ovo-Vegetarian',
    'Primal',
    'Low FODMAP',
    'Whole30'
  ];
  List<String> selectedDiets = [];
  final List<String> intolerances = const [
    'Gluten',
    'Dairy',
    'Egg',
    'Soy',
    'Seafood',
    'Peanut',
    'Tree Nut',
    'Shellfish',
    'Sesame',
    'Grain',
    'Wheat'
  ];
  List<String> selectedIntolerances = [];
  final List<String> types = const [
    'breakfast',
    'marinade',
    'main course',
    'appetizer',
    'soup',
    'Peanut',
    'snack',
    'salad',
    'sauce',
    'beverage',
  ];
  String selectedType = '[]';
  String minFat = '';
  String maxFat = '';
  String minCarbs = '';
  String maxCarbs = '';

  bool isMinFatSelected = false;
  bool isMaxFatSelected = false;
  bool isMinCarbsSelected = false;
  bool isMaxCarbsSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 20),
            child: Text(
              'Recipe Preferences',
              style: TextStyle(
                fontFamily: 'Noto Serif Bengali',
                color: TColors.textPrimary,
                fontSize: 20,
                height: 1.2,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        FilterChips(
          Ask: 'Do you follow any of the following diets?',
          filter: diet,
          selectedItems: selectedDiets,
          onSelected: (String value, bool selected) {
            setState(() {
              if (selected) {
                selectedDiets.add(value);
              } else {
                selectedDiets.remove(value);
              }
            });
          },
        ),
        FilterChips(
          Ask: 'Any ingredients allergies or intolerance?',
          filter: intolerances,
          selectedItems: selectedIntolerances,
          onSelected: (String value, bool selected) {
            setState(() {
              if (selected) {
                selectedIntolerances.add(value);
              } else {
                selectedIntolerances.remove(value);
              }
            });
          },
        ),
        SingleFilterChips(
          Ask: 'DishType',
          filter: types,
          selectedItem: selectedType,
          onSelected: (String value) {
            setState(() {
              selectedType = value;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, bottom: 10),
          child: Text(
            'Any more Preferences? ',
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
            spacing: 8.0,
            runSpacing: 4.0,
            children: [
              NumberInputChip(
                label: 'Min Fat',
                value: minFat,
                isSelected: isMinFatSelected,
                onSubmitted: (value) {
                  setState(() {
                    minFat = value;
                    isMinFatSelected = true;
                  });
                },
              ),
              NumberInputChip(
                label: 'Max Fat',
                value: maxFat,
                isSelected: isMaxFatSelected,
                onSubmitted: (value) {
                  setState(() {
                    maxFat = value;
                    isMaxFatSelected = true;
                  });
                },
              ),
              NumberInputChip(
                label: 'Min Carbs',
                value: minCarbs,
                isSelected: isMinCarbsSelected,
                onSubmitted: (value) {
                  setState(() {
                    minCarbs = value;
                    isMinCarbsSelected = true;
                  });
                },
              ),
              NumberInputChip(
                label: 'Max Carbs',
                value: maxCarbs,
                isSelected: isMaxCarbsSelected,
                onSubmitted: (value) {
                  setState(() {
                    maxCarbs = value;
                    isMaxCarbsSelected = true;
                  });
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: GestureDetector(
            onTap: () {
              BlocProvider.of<FilterCubit>(context).getFilter(
                  diets: selectedDiets,
                  intolerances: selectedIntolerances,
                  type: selectedType,
                  maxCarb: maxCarbs,
                  minCarb: minCarbs,
                  maxFat: maxFat,
                  minFat: minFat);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return BlocBuilder<FilterCubit, FilterState>(
                        builder: ((context, state) {
                      if (state is FilterLoadingState) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is FilterState) {
                        return FilterDishes();
                      } else {
                        return Text('opps there is a failure ');
                      }
                    }));
                  },
                ),
              );
            },
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: TColors.primary,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ImageIcon(
                      AssetImage('assets/icones/icons8-fantasy-24.png'),
                      color: TColors.white,
                      size: 20,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Apply Filter',
                      style: TextStyle(
                        fontFamily: 'Noto Serif Bengali',
                        color: TColors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
