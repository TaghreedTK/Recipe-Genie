import 'package:flutter/material.dart';
import 'package:food/features/screens/home_page/models/lists_model.dart';
import 'package:food/features/screens/home_page/widgets/cuisines_container.dart';

class CuisinesListView extends StatelessWidget {
  const CuisinesListView({super.key});
  final List<ListsModel> cuisines = const [
    ListsModel(image: 'assets/images/mexican.png', CuisinesName: 'Mexican'),
    ListsModel(
        image: 'assets/images/MiddleEast.jpg', CuisinesName: 'Middle Eastern'),
    ListsModel(image: 'assets/images/Korean.jpg', CuisinesName: 'Korean'),
    ListsModel(image: 'assets/images/chinese.jpg', CuisinesName: 'Chinese'),
    ListsModel(image: 'assets/images/japanese.jpg', CuisinesName: 'Japanese'),
    ListsModel(image: 'assets/images/indian.jpg', CuisinesName: 'Indian'),
    ListsModel(image: 'assets/images/italian.jpg', CuisinesName: 'Italian'),
    ListsModel(image: 'assets/images/Spanish.jpg', CuisinesName: 'Spanish'),
    ListsModel(image: 'assets/images/american.jpg', CuisinesName: 'African'),
    ListsModel(image: 'assets/images/german.png', CuisinesName: 'German'),
    ListsModel(image: 'assets/images/Asian.jpg', CuisinesName: 'Asian'),
  ];
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return CuisinesTile(
            list: cuisines[index],
          );
        },
        childCount: cuisines.length, // Adjust this if you have multiple items
      ),
    );
  }
}
