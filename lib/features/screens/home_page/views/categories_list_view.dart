import 'package:flutter/material.dart';
import 'package:food/features/screens/home_page/models/lists_model.dart';
import 'package:food/features/screens/home_page/widgets/category_tile.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});
  final List<ListsModel> categories = const [
    ListsModel(image: 'assets/images/Burgers.png', CuisinesName: 'Burgers'),
    ListsModel(image: 'assets/images/Pizza.png', CuisinesName: 'Pizza'),
    ListsModel(image: 'assets/images/Pasta.png', CuisinesName: 'Pasta'),
    ListsModel(image: 'assets/images/Salad.png', CuisinesName: 'Salads'),
    ListsModel(image: 'assets/images/Soups.png', CuisinesName: 'Soups'),
    ListsModel(
        image: 'assets/images/Sandwitches.png', CuisinesName: 'Sandwiches'),
    ListsModel(image: 'assets/images/desserts.png', CuisinesName: 'Desserts'),
    ListsModel(image: 'assets/images/Drinks.png', CuisinesName: 'Drinks'),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 120, // Adjust the height as needed
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            return CategoryTile(
              list: categories[index],
            );
          },
        ));
  }
}
