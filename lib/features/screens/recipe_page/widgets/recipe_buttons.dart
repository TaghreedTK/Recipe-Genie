// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/cubits/recipe_cupit/recipe_cubit.dart';

class RecipeButtons extends StatefulWidget {
  const RecipeButtons({
    Key? key,
    required this.id,
  }) : super(key: key);
  final String id;
  @override
  State<RecipeButtons> createState() => _RecipeButtonsState();
}

class _RecipeButtonsState extends State<RecipeButtons> {
  bool _isIPressed = true; // Ingredients button selected by default
  bool _isDpressed = false;
  bool _isISpressed = false;

  void _detailButton() {
    setState(() {
      _isDpressed = true;

      _isIPressed = false;
      _isISpressed = false;
    });
  }

  void _ingredientsButton() {
    setState(() {
      _isIPressed = true;
      _isDpressed = false;
      _isISpressed = false;
    });
  }

  void _instructionsButton() {
    setState(() {
      _isISpressed = true;
      _isDpressed = false;
      _isIPressed = false;
    });
  }

  void initState() {
    super.initState();
    // Call the ingredients function by default
    BlocProvider.of<RecipeCubit>(context).getIngredients(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Color(0xFFFBF8F8),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 10.0, bottom: 10, left: 20, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                _detailButton();
                BlocProvider.of<RecipeCubit>(context).getDetails(id: widget.id);
              },
              style: TextButton.styleFrom(
                backgroundColor:
                    _isDpressed ? Color(0xFFF0D6B5) : Color(0xFFFBF8F8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Text(
                'Detail',
                style: TextStyle(
                  fontFamily: 'Noto Serif Bengali',
                  fontSize: 11,
                  color: _isDpressed ? Colors.black : Color(0xFFC6B9A9),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8, left: 8),
              child: TextButton(
                onPressed: () {
                  _ingredientsButton();
                  BlocProvider.of<RecipeCubit>(context)
                      .getIngredients(id: widget.id);
                },
                style: TextButton.styleFrom(
                  backgroundColor:
                      _isIPressed ? Color(0xFFF0D6B5) : Color(0xFFFBF8F8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Text(
                  'Ingredients',
                  style: TextStyle(
                    fontFamily: 'Noto Serif Bengali',
                    fontSize: 11,
                    color: _isIPressed ? Colors.black : Color(0xFFC6B9A9),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                _instructionsButton();
                BlocProvider.of<RecipeCubit>(context)
                    .getInstructions(id: widget.id);
              },
              style: TextButton.styleFrom(
                backgroundColor:
                    _isISpressed ? Color(0xFFF0D6B5) : Color(0xFFFBF8F8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Text(
                'Instructions',
                style: TextStyle(
                  fontFamily: 'Noto Serif Bengali',
                  fontSize: 11,
                  color: _isISpressed ? Colors.black : Color(0xFFC6B9A9),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
