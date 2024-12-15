import 'package:flutter/material.dart';
import 'package:food/features/screens/cusine_page/views/Cuisines_list_view.dart';
import 'package:food/features/screens/filter_page/filter_page.dart';
import 'package:food/features/screens/home_page/views/categories_list_view.dart';
import 'package:food/features/screens/home_page/widgets/favourite_button.dart';
import 'package:food/features/screens/home_page/widgets/quote_tile.dart';
import 'package:food/features/screens/home_page/widgets/search_container.dart';
import 'package:food/utils/constants/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.main,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: TColors.main,
            toolbarHeight: 80,
            actions: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 10, right: 20.0, bottom: 20),
                child: TCircularIcon(
                  icon: AssetImage('assets/icones/filter.png'),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return FilterPage();
                        },
                      ),
                    );
                  },
                  backgroundColor: Colors.white,
                ),
              ),
            ],
            title: Padding(
              padding: const EdgeInsets.only(left: 5.0, top: 30),
              child: Row(
                children: [
                  SizedBox(
                    width: 270,
                    height: 80,
                    child: Text(
                      "Not Sure What to cook tonight?",
                      maxLines: 2,
                      style: TextStyle(
                        fontFamily: 'Noto Serif Bengali',
                        color: TColors.textPrimary,
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                        height: 1.2,
                      ),
                      strutStyle: StrutStyle(
                        height:
                            0.5, // Adjust this value to control the space between lines
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: IngredientsContainer()),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Quote(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 10),
              child: Text(
                'Random Recipes',
                style: TextStyle(
                  fontFamily: 'Noto Serif Bengali',
                  color: TColors.textPrimary,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: CategoriesListView()),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 10, top: 10),
              child: Text(
                'Cuisines',
                style: TextStyle(
                  fontFamily: 'Noto Serif Bengali',
                  color: TColors.textPrimary,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          CuisinesListView(),
        ],
      ),
    );
  }
}
