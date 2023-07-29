import 'package:flutter/material.dart';
import 'package:users_app_demo/core/constants/constants.dart';
import 'package:users_app_demo/core/reusable_widgets/custom_text.dart';
import 'package:users_app_demo/features/home/presentation/widgets/display_users.dart';

class UsersHomePage extends StatelessWidget {
  const UsersHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double availableHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
            text: Constants.usersAppDemoTxt,
            color: Constants.kWhite,
            fontSize: 20),
      ),
      body: Container(
        height: availableHeight,
        padding: const EdgeInsets.all(10),
        child: const Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Users:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Constants.gapH10,
            DisplayUsers(),
          ],
        ),
      ),
    );
  }
}
