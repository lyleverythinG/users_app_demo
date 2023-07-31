part of 'users_bloc.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersState {}

class UsersLoading extends UsersState {}

class UserResults extends UsersState {
  final List<Users> users;

  const UserResults({required this.users});

  @override
  List<Object> get props => [users];
}
