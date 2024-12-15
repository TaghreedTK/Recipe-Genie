import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/cubits/connect_cubit/connect_cubit.dart';
import 'package:food/cubits/connect_cubit/connect_state.dart';
import 'package:food/features/screens/connect_screen/widgets/auth_text_field.dart';
import 'package:food/features/screens/connect_screen/widgets/my_button.dart';
import 'package:food/features/widgets/navigation_bar.dart';
import 'package:food/utils/constants/colors.dart';
import 'package:food/utils/constants/sizes.dart';
import 'package:food/utils/constants/text_strings.dart';

import 'package:iconsax/iconsax.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class TConnectForm extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TConnectForm({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConnectCubit, ConnectState>(
      listener: (context, state) {
        if (state is ConnectError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is ConnectLoaded) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => Scaffold(
                bottomNavigationBar: MyNavigationBar(),
              ),
            ),
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        return Form(
            key: formKey,
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: TSizes.spaceBtwSections),
                child: Column(children: [
                  TAuthTextField(
                    controller: userNameController,
                    textInputType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.direct_right),
                        prefixIconColor: TColors.secondry,
                        labelText: 'Username',
                        labelStyle: TextStyle(color: TColors.textPrimary)),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwInputFields,
                  ),
                  TAuthTextField(
                    controller: emailController,
                    textInputType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TTexts.email,
                        prefixIcon: Icon(Iconsax.direct),
                        prefixIconColor: TColors.secondry,
                        labelStyle: TextStyle(color: TColors.textPrimary)),
                  ),

                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  // signin button
                  SizedBox(
                    width: double.infinity,
                    child: My_Button(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          FocusScope.of(context).unfocus();
                          context.read<ConnectCubit>().connectUser(
                                username: userNameController.text,
                                email: emailController.text,
                              );
                        }
                      },
                      label: 'Connect',
                      isLoading: state is ConnectLoading,
                    ),
                  )
                ])));
        // creat account
      },
    );
  }
}
