import 'package:flutter/material.dart';
import 'package:users_app_demo/features/home/presentation/widgets/users_card.dart';

class DisplayUsers extends StatelessWidget {
  const DisplayUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        // TODO: update this later for functionality implementation.
        itemCount: 8,
        itemBuilder: ((context, index) {
          return GestureDetector(
            // TODO: Add navigation going to user details screen
            onTap: () {},
            child: const UsersCard(),
          );
        }),
      ),
    );
  }
}
