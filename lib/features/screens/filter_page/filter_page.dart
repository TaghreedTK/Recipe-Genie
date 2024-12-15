import 'package:flutter/material.dart';
import 'package:food/features/screens/filter_page/widgets/filter_container.dart';
import 'package:food/utils/constants/colors.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.main,
      body: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              height: constraints.maxHeight - 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(35),
                  topLeft: Radius.circular(35),
                ),
              ),
              child: SingleChildScrollView(child: FilterContainer()),
            ),
          ],
        );
      }),
    );
  }
}
