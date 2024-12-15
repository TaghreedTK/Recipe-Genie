import 'dart:developer';

import 'package:food/cubits/connect_cubit/connect_state.dart';
import 'package:http_parser/http_parser.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/Di.dart';
import 'package:food/core/Sh.dart';
import 'package:dio/dio.dart';

class ConnectCubit extends Cubit<ConnectState> {
  ConnectCubit() : super(ConnectInitial());

  var dio = Dio();

  Future<void> connectUser({
    required String email,
    required String username,
  }) async {
    try {
      emit(ConnectLoading());

      var response = await dio.request(
          'https://api.spoonacular.com/users/connect?apiKey=3cf407f3aeae4d15a7d782750b630ed9',
          options: Options(
            method: 'POST',
            headers: {
              'Content-Type': 'application/json',
            },
          ),
          data: {"username": username, "email": email});

      if (response.statusCode == 200) {
        // Handle successful registration
        final hash = response.data['hash'];

        sl<MySharedPrefInterface>().putString(
          key: MySharedKeys.hash,
          value: hash,
        );

        sl<MySharedPrefInterface>().putString(
          key: MySharedKeys.username,
          value: username,
        );
          sl<MySharedPrefInterface>().putString(
          key: MySharedKeys.email,
          value: email,
        );

        emit(ConnectLoaded());
        log(hash);
      } else {
        // Handle error
        emit(ConnectError(
            error: 'Register failed with status code: ${response.statusCode}'));
      }
    } on DioException catch (error) {
      emit(ConnectError(error: 'Error: ${error.response!.data.toString()}'));
    }
  }
}
