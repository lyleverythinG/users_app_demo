import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_app_demo/core/reusable_widgets/loading.dart';
import 'package:users_app_demo/features/home/presentation/bloc/bloc/users_bloc.dart';
import 'package:users_app_demo/features/home/presentation/pages/users_info_screen.dart';
import 'package:users_app_demo/features/home/presentation/widgets/empty_users_text.dart';
import 'package:users_app_demo/features/home/presentation/widgets/users_card.dart';

class DisplayUsers extends StatelessWidget {
  const DisplayUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(
      builder: (context, state) {
        if (state is UsersInitial) {
          context.read<UsersBloc>().add(GetUsersEvent(context: context));
        }
        if (state is UsersLoading) {
          return const Loading();
        }
        if (state is UserResults) {
          if (state.users.isNotEmpty) {
            return Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                // TODO: update this later for functionality implementation.
                itemCount: state.users.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    // TODO: Add navigation going to user details screen
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UsersInfoScreen(
                          id: state.users[index].id,
                          name: state.users[index].name,
                          imageUrl: state.users[index].imageUrl,
                        ),
                      ),
                    ),
                    child: UsersCard(
                        id: state.users[index].id,
                        imageUrl: state.users[index].imageUrl,
                        name: state.users[index].name),
                  );
                }),
              ),
            );
          } else {
            return const EmptyUsersText();
          }
        }
        return const SizedBox.shrink();
      },
    );
  }
}
