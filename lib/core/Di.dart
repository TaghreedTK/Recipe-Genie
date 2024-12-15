import 'package:food/core/Sh.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<MySharedPrefInterface>(
    () => MySharedPref(),
  );
}
