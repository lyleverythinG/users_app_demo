part of 'users_bloc.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();
}

class GetUsersEvent extends UsersEvent {
  final BuildContext context;
  const GetUsersEvent({required this.context});
  @override
  List<Object> get props => [context];
}
