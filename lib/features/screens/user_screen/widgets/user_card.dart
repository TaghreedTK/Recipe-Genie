import 'package:flutter/material.dart';
import 'package:food/core/Di.dart';
import 'package:food/core/Sh.dart';
import 'package:food/features/screens/user_screen/widgets/section_handealing.dart';
import 'package:food/features/screens/user_screen/widgets/user_menu.dart';
import 'package:food/utils/constants/sizes.dart';

import 'package:iconsax/iconsax.dart';

class profileCard extends StatefulWidget {
  const profileCard({
    super.key,
  });

  @override
  State<profileCard> createState() => _profileCardState();
}

class _profileCardState extends State<profileCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(
                  height: TSizes.spaceBtwItems / 2,
                ),
                const Divider(),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                const sectionHeading(
                  title: 'profile Informatiom',
                  showActionButton: false,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                ProfileMenu(
                  onPressed: () {},
                  title: 'username',
                  value: sl<MySharedPrefInterface>()
                      .getString(key: MySharedKeys.username),
                  icon: Iconsax.copy,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                const Divider(),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                ProfileMenu(
                  onPressed: () {},
                  title: 'User Id',
                  value: sl<MySharedPrefInterface>()
                      .getString(key: MySharedKeys.hash),
                  icon: Iconsax.copy,
                ),
                ProfileMenu(
                  onPressed: () {},
                  title: 'Email',
                  value: sl<MySharedPrefInterface>()
                      .getString(key: MySharedKeys.email),
                ),
              ],
            ),
          )
        ]));
  }
}
