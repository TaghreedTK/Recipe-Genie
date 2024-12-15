// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:food/cubits/cuisines_cubit/cuisines_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/features/screens/cusine_page/widgets/dishes_tile.dart';

import 'package:food/utils/constants/colors.dart';

class CusinesScreen extends StatelessWidget {
  const CusinesScreen({
    Key? key,
    required this.custineName,
  }) : super(key: key);
  final String custineName;

  @override
  Widget build(BuildContext context) {
    var dishes = BlocProvider.of<ListCubit>(context).cusineModel;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: TColors.primary,
            onPressed: () {
              Navigator.pop(context);

              // Navigate back to the previous screen
            },
          ),
          backgroundColor: Colors.transparent,
          title: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              '${custineName} Custine',
              style: TextStyle(
                  fontFamily: 'Noto Serif Bengali',
                  color: TColors.textPrimary,
                  fontSize: 20,
                  height: 1.2,
                  fontWeight: FontWeight.w900),
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildBuilderDelegate(childCount: dishes.length,
                    (context, index) {
              return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: DishesTile(
                    dish: dishes[index],
                  ));
            }))
          ],
        ));
  }
}
