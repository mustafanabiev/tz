import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({super.key, this.isProfile = false});

  final bool isProfile;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          const Text(
            'Профиль участника',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Futura PT',
              fontWeight: FontWeight.w500,
              height: 0.06,
            ),
          ),
          const SizedBox(width: 16),
          PopupMenuButton<String>(
            icon: SvgPicture.asset(
              'assets/icons/list.svg',
            ),
            onSelected: (String value) {},
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.white),
            ),
            offset: const Offset(-5, 42),
            itemBuilder: (BuildContext context) {
              return [
                _buildPopupMenuItem(
                  text: 'Профиль участника',
                  icon: isProfile
                      ? 'assets/icons/check_off.svg'
                      : 'assets/icons/check_on.svg',
                ),
                _buildPopupMenuItem(
                  text: 'Биометрия',
                  icon: 'assets/icons/check_off.svg',
                ),
                _buildPopupMenuItem(
                  text: 'Паспортные данные',
                  icon: isProfile
                      ? 'assets/icons/check_on.svg'
                      : 'assets/icons/check_off.svg',
                ),
                _buildPopupMenuItem(
                  text: 'Место работы',
                  icon: 'assets/icons/check_off.svg',
                ),
                _buildPopupMenuItem(
                  text: 'Оплата участия',
                  icon: 'assets/icons/check_off.svg',
                ),
                _buildPopupMenuItem(
                  text: 'Бейдж готов к выдаче',
                  icon: 'assets/icons/check_off.svg',
                  disabled: true,
                ),
              ];
            },
          ),
        ],
      ),
    );
  }

  PopupMenuItem<String> _buildPopupMenuItem({
    required String text,
    required String icon,
    bool selected = false,
    bool disabled = false,
  }) {
    FontWeight fontWeight = selected ? FontWeight.w600 : FontWeight.w400;

    return PopupMenuItem<String>(
      value: text,
      enabled: !disabled,
      child: Container(
        color: selected ? const Color(0xffE6F8F9) : Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                color: disabled ? Colors.grey : const Color(0xFF1B1717),
                fontSize: 16,
                fontFamily: 'Futura PT',
                fontWeight: fontWeight,
                height: 0.08,
              ),
            ),
            SvgPicture.asset(
              icon,
              color: disabled ? Colors.grey : const Color(0xFF1B1717),
            ),
          ],
        ),
      ),
    );
  }
}
