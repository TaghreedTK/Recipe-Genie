import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food/features/screens/home_page/widgets/input_ingredients.dart';
import 'package:food/utils/constants/colors.dart';

class IngredientsContainer extends StatefulWidget {
  const IngredientsContainer({super.key});

  @override
  State createState() => _IngredientsContainerState();
}

class _IngredientsContainerState extends State<IngredientsContainer> {
  final List<Map<String, dynamic>> selectedIngredients = [];

  void _addIngredient(String ingredient) {
    setState(() {
      if (ingredient.isNotEmpty) {
        selectedIngredients.add({'value': ingredient, 'isSelected': true});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 25, right: 25),
      child: Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFEBD6B5),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Stack(
            children: [
              Positioned(
                top: 15,
                left: 15,
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ImageIcon(
                        AssetImage('assets/icones/icons8-fantasy-24.png'),
                        color: TColors.primary,
                        size: 24,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SizedBox(
                        width: 220,
                        child: Text(
                          'We\'ll conjure a recipe from your ingredients',
                          maxLines: 2,
                          style:
                              TextStyle(color: Color(0xFF6D6153), fontSize: 13),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 90,
                    decoration: BoxDecoration(
                      color: TColors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Wrap(
                      children: [
                        IngredientsInputChip(
                          isSelected: false,
                          onSubmitted: _addIngredient,
                          value: '',
                        ),
                        SizedBox(
                          height: 30,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: selectedIngredients.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: IngredientsInputChip(
                                  onSubmitted: (value) {},
                                  value: selectedIngredients[index]['value'],
                                  isSelected: selectedIngredients[index]
                                      ['isSelected'],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                right: 10,
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
                          'Generate Recipe',
                          style: TextStyle(
                            fontFamily: 'Noto Serif Bengali',
                            color: TColors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
