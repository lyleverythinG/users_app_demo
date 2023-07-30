import 'package:flutter/material.dart';
import 'package:users_app_demo/core/reusable_widgets/custom_text.dart';

class EmptyUsersText extends StatelessWidget {
  const EmptyUsersText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .7,
      child: const Center(
        child: CustomText(
          text: 'Empty Users',
        ),
      ),
    );
  }
}
