import 'package:flutter/material.dart';
import 'package:users_app_demo/core/constants/constants.dart';
import 'package:users_app_demo/core/reusable_widgets/custom_text.dart';

class UsersCard extends StatelessWidget {
  final String id;
  final String name;
  final String imageUrl;
  const UsersCard(
      {super.key,
      required this.id,
      required this.name,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Constants.kBlueAccent,
      elevation: 3,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'id: $id',
                    ),
                    Constants.gapH4,
                    CustomText(
                      text: 'Name: $name',
                    ),
                    Constants.gapH8,
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
