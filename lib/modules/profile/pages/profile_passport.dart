import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:tz/components/custom_card.dart';

class ProfilePassport extends StatefulWidget {
  const ProfilePassport({super.key});

  @override
  State<ProfilePassport> createState() => _ProfilePassportState();
}

class _ProfilePassportState extends State<ProfilePassport> {
  String? dateData;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 48),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        gradient: LinearGradient(
          colors: [
            Color(0XFF5690AE),
            Color(0XFF63699A),
            Color(0XFF963B81),
            Color(0XFFA51866),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        image: DecorationImage(
          image: AssetImage('assets/images/bg_menu.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Выберите документ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Futura PT',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xffEAD7E5),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
                width: double.infinity,
                height: 56,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Паспорт РФ',
                      style: TextStyle(
                        color: Color(0xFF1B1717),
                        fontSize: 16,
                        fontFamily: 'Futura PT',
                        fontWeight: FontWeight.w400,
                        height: 0.08,
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const CustomForm(text: 'Серия номер паспорта'),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              DateTime date = DateTime.now();
              showCupertinoModalPopup<void>(
                context: context,
                builder: (BuildContext context) => Container(
                  height: 216,
                  padding: const EdgeInsets.only(top: 6.0),
                  margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  color: CupertinoColors.systemBackground.resolveFrom(context),
                  child: SafeArea(
                    top: false,
                    child: CupertinoDatePicker(
                      initialDateTime: date,
                      mode: CupertinoDatePickerMode.date,
                      use24hFormat: true,
                      showDayOfWeek: true,
                      onDateTimeChanged: (DateTime newDate) {
                        String formattedDate =
                            DateFormat('dd.MM.yyyy').format(newDate);
                        setState(() {
                          dateData = formattedDate;
                        });
                      },
                    ),
                  ),
                ),
              );
            },
            child: CustomForm(
              text: 'Дата рождения',
              enabled: false,
              hintText: dateData,
              suffixIcon: SvgPicture.asset(
                'assets/icons/calendarA.svg',
              ),
            ),
          ),
          const SizedBox(height: 16),
          Opacity(
            opacity: .8,
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color(0xffED1751),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Проверить паспорт',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Futura PT',
                    fontWeight: FontWeight.w500,
                    height: 0.08,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
