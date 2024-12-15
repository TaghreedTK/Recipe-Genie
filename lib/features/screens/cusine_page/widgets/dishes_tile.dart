// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:food/features/screens/home_page/models/dish_model.dart';
import 'package:dio/dio.dart';
import 'package:food/features/screens/home_page/services/dish_service.dart';
import 'package:food/features/screens/meal_plan_page/services/add_meal_service.dart';
import 'package:food/features/screens/recipe_page/recipe_screen.dart';

import 'package:food/features/widgets/add_mealPlan_dialog.dart';
import 'package:food/utils/constants/colors.dart';
import 'package:food/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class DishesTile extends StatefulWidget {
  const DishesTile({
    Key? key,
    required this.dish,
  }) : super(key: key);
  final DishModel dish;

  @override
  State<DishesTile> createState() => _DishesTileState();
}

class _DishesTileState extends State<DishesTile> {
    final TextEditingController _dateController = TextEditingController();
  final TextEditingController _slotController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return RecipeScreen(
                  dishName: widget.dish.dishName,
                  dishId: widget.dish.id,
                  dishImage: widget.dish.image,
                );
              },
            ),
          );
        },
        child: Container(
          height: 90,
          decoration: BoxDecoration(
            color: TColors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage(widget.dish.image),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 220,
                    child: Text(
                      widget.dish.dishName,
                      maxLines: 3,
                      style: TextStyle(
                          fontFamily: 'Noto Serif Bengali',
                          color: TColors.textPrimary,
                          fontSize: 15,
                          height: 1.2,
                          fontWeight: FontWeight.bold),
                      strutStyle: StrutStyle(
                        height: 0.5,
                        // Adjust this value to control the space between lines
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                right: 0.0,
                bottom: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                      color: TColors.primary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(TSizes.cardRadiuslg),
                        bottomRight: Radius.circular(TSizes.productImageRadius),
                      )),
                  child: SizedBox(
                    width: TSizes.iconlg * 1.2,
                    height: TSizes.iconlg * 1.2,
                    child: Center(
                      child: IconButton(
                        icon: Icon(
                          Iconsax.calendar5,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
      title: Text(''),
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

           AddMealService(Dio()).addToMealPlan(date: date, slot: slot, position: position, id: widget.dish.id, title: widget.dish.dishName, image: widget.dish.image, );
            Navigator.of(context).pop();
          },
          child: Text('Submit'),
        ),
      ],
    );} );
                  
                        },
                     
                    ),
                  ),
                ),
              )
          )],
          ),
        ),
      ),
    );
  }
}
