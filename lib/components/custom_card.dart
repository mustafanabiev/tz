import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({
    super.key,
    required this.text,
    this.isBtn = false,
    this.suffixIcon,
    this.hintText,
    this.enabled = true,
  });

  final String text;
  final bool isBtn;
  final Widget? suffixIcon;
  final String? hintText;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'Futura PT',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: double.infinity,
          height: 56,
          child: isBtn
              ? ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(
                      color: Colors.white.withOpacity(0.6000000238418579),
                      width: 2,
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Спикер',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Futura PT',
                      fontWeight: FontWeight.w500,
                      height: 0.08,
                    ),
                  ),
                )
              : TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: hintText,
                    hintStyle: const TextStyle(
                      color: Color(0xFF1B1717),
                      fontSize: 16,
                      fontFamily: 'Futura PT',
                      fontWeight: FontWeight.w400,
                      height: 0.08,
                    ),
                    enabled: enabled,
                    suffixIcon: suffixIcon,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
