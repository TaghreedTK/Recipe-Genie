// import 'package:flutter/material.dart';
// import 'package:food/cubits/cuisines_cubit/cuisines_cubit.dart';
// import 'package:food/features/screens/cusine_page/widgets/dishes_tile.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class CDishesListView extends StatelessWidget {
//   const CDishesListView({super.key});
//   final

//   @override
//   Widget build(BuildContext context) {
//     final cuisinesCubit = BlocProvider.of<CusinesCubit>(context);
//     final cuisineModel = cuisinesCubit.cusineModel;
//     return SliverList(
      
//         delegate: SliverChildBuilderDelegate(childCount: cuisineModel.length,
//             (context, index) {
//       return Padding(
//         padding: const EdgeInsets.only(bottom: 22),
//         child: DishesTile();
//       );
//     }));
//   }
// }