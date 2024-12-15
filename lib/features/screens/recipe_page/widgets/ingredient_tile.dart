import 'package:flutter/material.dart';
import 'package:food/features/screens/recipe_page/models/ingredients_model.dart';
import 'package:food/utils/constants/colors.dart';

class IngrediantTile extends StatelessWidget {
  const IngrediantTile({super.key, required this.ingredient});
  final IngredientsModel ingredient;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        right: 20,
      ),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 90,
          decoration: BoxDecoration(
              color: TColors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0xFFFBF8F8), width: 3)),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Color(0xFFC6B9A9),
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: CircleAvatar(
                      backgroundColor: TColors.white,
                      radius: 50,
                      backgroundImage: NetworkImage(
                          'https://img.spoonacular.com/ingredients_100x100/${ingredient.image}',
                          scale: 0.1),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 30,
                left: 110,
                child: Text(
                  ingredient.Name,
                  style: TextStyle(
                      fontFamily: 'Noto Serif Bengali',
                      color: TColors.textPrimary,
                      fontSize: 15,
                      height: 1.2,
                      fontWeight: FontWeight.normal),
                  strutStyle: StrutStyle(
                    height:
                        0.5, // Adjust this value to control the space between lines
                  ),
                ),
              ),
              Positioned(
                right: 10,
                top: 50,
                child: Row(
                  children: [
                    Text(
                      '${ingredient.value.toString()} ',
                      style: TextStyle(
                          color: TColors.primary,
                          fontSize: 15,
                          height: 1.2,
                          fontWeight: FontWeight.normal),
                    ),
                    Text(
                      ingredient.unit,
                      style: TextStyle(
                          fontFamily: 'Noto Serif Bengali',
                          color: TColors.primary,
                          fontSize: 15,
                          height: 1.2,
                          fontWeight: FontWeight.normal),
                      strutStyle: StrutStyle(
                        height:
                            0.5, // Adjust this value to control the space between lines
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
