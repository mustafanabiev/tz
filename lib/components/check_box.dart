import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({
    super.key,
    this.onTap,
    required this.richText,
    this.end = false,
    required this.select,
  });

  final void Function()? onTap;
  final InlineSpan richText;
  final bool end;
  final bool select;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment:
          end ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: SvgPicture.asset(
            'assets/icons/${select ? 'check_box_on' : 'check_box_off'}.svg',
          ),
        ),
        const SizedBox(width: 8),
        Expanded(child: RichText(text: richText)),
      ],
    );
  }
}
