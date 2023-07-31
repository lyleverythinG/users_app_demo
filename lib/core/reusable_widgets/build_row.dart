import 'package:flutter/material.dart';
import 'package:users_app_demo/core/reusable_widgets/custom_text.dart';

class BuildRow extends StatelessWidget {
  final String label;
  final String text;
  const BuildRow({super.key, required this.text, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(text: '$label: '),
        CustomText(text: text),
      ],
    );
  }
}
