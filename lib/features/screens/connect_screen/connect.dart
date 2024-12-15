import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/common/styles/spacing_styles.dart';
import 'package:food/cubits/connect_cubit/connect_cubit.dart';
import 'package:food/features/screens/connect_screen/widgets/connect_form.dart';
import 'package:food/features/screens/connect_screen/widgets/connect_header.dart';
import 'package:food/utils/constants/colors.dart';

class ConnectScreen extends StatefulWidget {
  ConnectScreen({super.key});

  @override
  State<ConnectScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<ConnectScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConnectCubit(),
      child: Scaffold(
        backgroundColor: TColors.main,
        body: SingleChildScrollView(
            child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(children: [
            SizedBox(
              height: 60,
            ),
            TLoginHeader(),
            TConnectForm(),

            // footer
          ]),
        )),
      ),
    );
  }
}
