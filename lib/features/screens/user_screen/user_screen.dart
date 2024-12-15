import 'package:flutter/material.dart';
import 'package:food/features/screens/user_screen/widgets/user_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: profileCard(),
      ),
    );
    //
  }
}
