import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    required this.text1,
    required this.text2,
  });

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$text1 ',
          style: TextStyle(
            color: Colors.white.withOpacity(0.4000000059604645),
            fontSize: 12,
            fontFamily: 'Futura PT',
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          text2,
          style: TextStyle(
            color: Colors.white.withOpacity(0.699999988079071),
            fontSize: 12,
            fontFamily: 'Futura PT',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
