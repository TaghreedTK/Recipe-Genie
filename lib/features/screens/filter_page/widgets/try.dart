// import 'package:flutter/material.dart';

// class diet extends StatefulWidget {
//   const diet({super.key});

//   @override
//   State<diet> createState() => _dietState();
// }

// class _dietState extends State<diet> {
//   final List<String> diet = const [
//     'Gluten Free',
//     'Kelogenic',
//     'vegetrian',
//     'Lacto-Vegetarian',
//     'Ovo-Vegetarian',
//     'Vegan',
//     'Pescetarian',
//     'Paleo',
//     'Primal',
//     'Low FODMAP',
//     'Low FODMAP',
//     'Whole30'
//   ];
//   List<bool> isSelectedD = [];

//   @override
//   void initState() {
//     super.initState();

//     isSelectedD = List<bool>.generate(diet.length, (index) => index == 0);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SliverList(
//       delegate: SliverChildBuilderDelegate(
//         (BuildContext context, int index) {
//           return TextButton(
//             onPressed: () {
//               setState(() {
//                 for (int i = 0; i < isSelectedD.length; i++) {
//                   isSelectedD[i] = i == index;
//                 }
//               });
//             },
//             style: TextButton.styleFrom(
//               backgroundColor:
//                   isSelectedD ? Color(0xFFF0D6B5) : Color(0xFFFBF8F8),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//               ),
//             ),
//             child: Text(
//               'Detail',
//               style: TextStyle(
//                 fontFamily: 'Noto Serif Bengali',
//                 fontSize: 11,
//                 color: isSelectedD ? Colors.black : Color(0xFFC6B9A9),
//               ),
//             ),
//           );
//         },
//         childCount: diet.length, // Adjust this if you have multiple items
//       ),
//     );
//   }
// }
