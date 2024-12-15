import 'package:flutter/material.dart';
import 'package:food/cubits/connect_cubit/connect_cubit.dart';
import 'package:food/cubits/filter_cubit/filter_cubit.dart';
import 'package:food/cubits/plan_search_cubit/plan_search_cubit.dart';
import 'package:food/cubits/recipe_cupit/recipe_cubit.dart';
import 'package:food/cubits/search_recipe_cubit/search_recipe_cubit.dart';
import 'package:food/cubits/similer_cubit/similer_cubit.dart';
import 'package:food/features/screens/connect_screen/connect.dart';
import 'package:food/features/screens/filter_page/filter_page.dart';
import 'package:food/features/screens/home_page/home_page..dart';
import 'package:food/features/screens/recipe_page/recipe_screen.dart';
import 'package:food/features/screens/recipe_page/widgets/recipe_image.dart';
import 'package:food/features/widgets/navigation_bar.dart';
import 'package:food/utils/theme/custom_themes/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/cubits/cuisines_cubit/cuisines_cubit.dart';
import 'package:food/core/Di.dart';
import 'package:food/core/Sh.dart';
import 'package:food/core/Di.dart' as di;
import 'observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  await di.sl<MySharedPrefInterface>().initSP();
  print(di.sl<MySharedPrefInterface>().getString(key: MySharedKeys.hash));
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final hash = sl<MySharedPrefInterface>().getString(key: MySharedKeys.hash);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ListCubit()),
        BlocProvider(create: (context) => RecipeCubit()),
        BlocProvider(create: (context) => FilterCubit()),
        BlocProvider(create: (context) => PlanSearchrCubit()),
        BlocProvider(create: (context) => SearchRecipeCubit()),
        BlocProvider(create: (context) => ConnectCubit()),
        BlocProvider(create: (context) => SimilerCubit()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // themeMode: ThemeMode.system,
          // theme: TAppTheme.lightTheme,
          // darkTheme: TAppTheme.darkTheme,
          home: hash == "" ? ConnectScreen() : MyNavigationBar()),
    );
  }
}
