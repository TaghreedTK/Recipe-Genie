import 'package:flutter/material.dart';
import 'package:food/cubits/cuisines_cubit/cuisines_cubit.dart';
import 'package:food/features/screens/cusine_page/category_page.dart';
import 'package:food/features/screens/cusine_page/cusines_page.dart';
import 'package:food/features/screens/home_page/models/lists_model.dart';
import 'package:food/utils/constants/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({super.key, required this.list});
  final ListsModel list;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<ListCubit>(context)
              .getCategory(category: list.CuisinesName);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return BlocBuilder<ListCubit, ListState>(
                    builder: ((context, state) {
                  if (state is CategoryLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is CategoryLoadedState) {
                    return CategoryScreen(
                      custineName: list.CuisinesName,
                    );
                  } else {
                    return Text('opps there is a failure ');
                  }
                }));
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
          child: Row(
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
                      image: AssetImage(list.image),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 20),
                child: Text(
                  list.CuisinesName,
                  style: TextStyle(
                      fontFamily: 'Noto Serif Bengali',
                      color: TColors.textPrimary,
                      fontSize: 15,
                      height: 1.2),
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
    );
  }
}
