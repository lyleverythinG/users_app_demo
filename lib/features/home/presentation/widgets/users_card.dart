import 'package:flutter/material.dart';
import 'package:users_app_demo/core/constants/constants.dart';
import 'package:users_app_demo/core/reusable_widgets/custom_text.dart';

class UsersCard extends StatelessWidget {
  const UsersCard({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: use real data later for implementation.
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
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://www.alchinlong.com/wp-content/uploads/2015/09/sample-profile.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'test name',
                    ),
                    Constants.gapH4,
                    CustomText(
                      text: 'id: 1',
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
