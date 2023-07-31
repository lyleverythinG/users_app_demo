import 'package:flutter/material.dart';
import 'package:users_app_demo/core/constants/constants.dart';

class ProfileCircleAvatar extends StatelessWidget {
  final String imageUrl;
  const ProfileCircleAvatar({Key? key, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: MediaQuery.of(context).size.width * 0.20,
        backgroundColor: Constants.kWhite,
        backgroundImage: NetworkImage(imageUrl),
      ),
    );
  }
}
