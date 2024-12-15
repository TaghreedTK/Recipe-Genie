import 'package:flutter/material.dart';
import 'package:food/cubits/plan_search_cubit/plan_search_cubit.dart';
import 'package:food/utils/constants/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController searchController = TextEditingController();

    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 25, right: 8.0, left: 8.0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: TColors.mainSecondry,
                borderRadius: BorderRadius.circular(800),
                boxShadow: [
                  BoxShadow(
                    color: TColors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Form(
                  child: TextFormField(
                    controller: searchController,
                    textAlign: TextAlign.left,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 24),
                      hintText: 'Search date (YY-MM-DD)',
                      hintStyle: TextStyle(
                        color: TColors.textPrimary,
                      ),
                      suffixIcon: IconButton(
                        color: TColors.primary,
                        onPressed: () {
                          {
                            BlocProvider.of<PlanSearchrCubit>(context)
                                .getSearchData(date: searchController.text);
                            // Keep the focus on the text field
                          }
                        },
                        icon: Icon(Icons.search),
                      ),
                      border: InputBorder.none,
                      alignLabelWithHint: true,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
