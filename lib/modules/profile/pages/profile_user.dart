import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:tz/components/check_box.dart';
import 'package:tz/components/custom_card.dart';
import 'package:tz/components/custom_radio_button.dart';
import 'package:tz/modules/main/pages/main_page.dart';
import 'package:tz/modules/profile/cubit/profile_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileUser extends StatefulWidget {
  const ProfileUser({super.key});

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  String groupValue = '';
  String? dateData;
  bool checkBox1 = false;
  bool checkBox2 = false;
  bool checkBox3 = false;
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
          const CustomForm(text: 'Тип участника', isBtn: true),
          const SizedBox(height: 8),
          const CustomForm(text: 'Фамилия'),
          const SizedBox(height: 8),
          const CustomForm(text: 'Имя'),
          const SizedBox(height: 8),
          const CustomForm(text: 'Отчество'),
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
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Пол',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Futura PT',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  CustomRadioButton(
                    onChanged: (value) {
                      setState(() {
                        groupValue = value!;
                      });
                    },
                    groupValue: groupValue,
                    value: 'male',
                    title: 'Мужской',
                  ),
                  const SizedBox(width: 8),
                  CustomRadioButton(
                    onChanged: (value) {
                      setState(() {
                        groupValue = value!;
                      });
                    },
                    groupValue: groupValue,
                    value: 'female',
                    title: 'Женский',
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Я являюсь',
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
                      'Физическим лицом',
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
          const SizedBox(height: 16),
          const Text(
            'Для полноценной работы и регистрации на FINOPOLIS 2024 заполните персональные данные',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Futura PT',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 16),
          CheckBoxWidget(
            onTap: () {
              setState(() {
                checkBox1 = !checkBox1;
              });
            },
            select: checkBox1,
            richText: TextSpan(
              children: <TextSpan>[
                const TextSpan(
                  text: 'Я ознакомлен ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Futura PT',
                    fontWeight: FontWeight.w400,
                    height: 0.08,
                  ),
                ),
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _launchUrl(
                        Uri.parse(
                          'https://finopolis.ru/upload/docs/digital_signature.pdf',
                        ),
                      );
                    },
                  text:
                      'с соглашением о применении простой электронной подписи ',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Futura PT',
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const TextSpan(
                  text:
                      'для целей предоставления согласия на обработку персональных данных *',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Futura PT',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          CheckBoxWidget(
            onTap: () {
              setState(() {
                checkBox2 = !checkBox2;
              });
            },
            select: checkBox2,
            richText: const TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Я ознакомлен ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Futura PT',
                    fontWeight: FontWeight.w400,
                    height: 0.08,
                  ),
                ),
                TextSpan(
                  text:
                      'с соглашением о применении простой электронной подписи ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Futura PT',
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(
                  text:
                      'для целей предоставления согласия на обработку биометрических персональных данных *',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Futura PT',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          CheckBoxWidget(
            onTap: () {
              setState(() {
                checkBox3 = !checkBox3;
              });
            },
            end: true,
            select: checkBox3,
            richText: const TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Я согласен на получение рассылок *',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Futura PT',
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Opacity(
            opacity: checkBox1 == true &&
                    checkBox2 == true &&
                    checkBox3 == true &&
                    groupValue != ''
                ? 1
                : .8,
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      if (checkBox1 == true &&
                          checkBox2 == true &&
                          checkBox3 == true &&
                          groupValue != '' &&
                          state.image != null) {
                        context.read<ProfileCubit>().goToHome();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainPage(),
                          ),
                          (route) => false,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color(0xffED1751),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Далее',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Futura PT',
                        fontWeight: FontWeight.w500,
                        height: 0.08,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
