import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:users_app_demo/core/constants/constants.dart';
import 'package:users_app_demo/core/reusable_widgets/failure.dart';
import 'package:users_app_demo/features/home/domain/model/users.dart';
import 'package:http/http.dart' as http;

typedef FutureEither<T> = Future<Either<Failure, T>>;

class UsersRepo {
  /// Function that retrieves users from the API endpoint using http request without duplicates.
  FutureEither<List<Users>> getUsers() async {
    try {
      final response = await http.get(Uri.parse(Constants.apiEndpoint));
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);
        debugPrint(response.body);
        final List<Users> users =
            jsonResponse.map((json) => Users.fromJson(json)).toList();

        // Returns unique users from the list based from id.
        return right(users.toSet().toList());
      } else {
        return left(Failure(
            'Failed to load users. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
