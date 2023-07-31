import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_app_demo/core/reusable_widgets/snackbar.dart';
import 'package:users_app_demo/features/home/data/repository/users_repo.dart';
import 'package:users_app_demo/features/home/domain/model/users.dart';
part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UsersRepo usersRepo;
  UsersBloc({required this.usersRepo}) : super(UsersInitial()) {
    on<GetUsersEvent>((event, emit) async {
      try {
        emit(UsersLoading());
        final result = await usersRepo.getUsers();
        result.fold(
            (failed) => showSnackBar(
                event.context, 'CHATGPT could not respond at the moment'),
            (users) => emit(UserResults(users: users)));
      } catch (e) {
        debugPrint('Get Users Error: $e');
      }
    });
  }
}
