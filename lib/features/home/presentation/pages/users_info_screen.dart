import 'package:flutter/material.dart';
import 'package:users_app_demo/core/constants/constants.dart';
import 'package:users_app_demo/core/reusable_widgets/build_row.dart';
import 'package:users_app_demo/features/home/presentation/widgets/profile_circle_avatar.dart';

class UsersInfoScreen extends StatelessWidget {
  final String id;
  final String name;
  final String imageUrl;
  const UsersInfoScreen(
      {super.key,
      required this.id,
      required this.name,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            ProfileCircleAvatar(imageUrl: imageUrl),
            Constants.gapH10,
            BuildRow(label: 'Id', text: id),
            Constants.gapH10,
            BuildRow(label: 'Name', text: name),
          ],
        ),
      ),
    );
  }
}
