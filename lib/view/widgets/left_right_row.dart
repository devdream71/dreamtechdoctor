import 'package:dream_tech_doctor/utils/colors.dart';
import 'package:flutter/material.dart';

class RowLeftRightText extends StatelessWidget {
  final String text1;
  final String text2;
  void Function()? onTap;
  RowLeftRightText(
      {super.key,
      required this.text1,
      required this.text2,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            text2,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: AppColor.primaryColor),
          ),
        )
      ],
    );
  }
}
