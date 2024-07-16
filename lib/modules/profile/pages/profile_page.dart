import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tz/components/custom_text_widget.dart';
import 'package:tz/components/popup_menu.dart';
import 'package:tz/modules/profile/cubit/profile_cubit.dart';
import 'package:tz/modules/profile/pages/profile_passport.dart';
import 'package:tz/modules/profile/pages/profile_user.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0XFF1B2829),
                          Color(0XFF356364),
                          Color(0XFF1D1F1F),
                        ],
                        stops: [.0, .5, .8],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      image: DecorationImage(
                        image: state.image == null
                            ? const AssetImage('assets/images/bg_card.png')
                            : FileImage(state.image!),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: SafeArea(
                      bottom: false,
                      child: Container(
                        height: state.isAuth ? 320 : 410,
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/calendarA.svg',
                                ),
                                const SizedBox(width: 8),
                                SvgPicture.asset(
                                  'assets/icons/notificationA.svg',
                                ),
                              ],
                            ),
                            if (state.image == null)
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      context.read<ProfileCubit>().saveImage();
                                    },
                                    child: Column(
                                      children: [
                                        Image.asset(
                                            'assets/images/user-photo.png'),
                                        const SizedBox(height: 4),
                                        const Text(
                                          'Выбрать фотографию',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFF10B9C5),
                                            fontSize: 16,
                                            fontFamily: 'Futura PT',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const CustomTextWidget(
                                    text1: 'Формат',
                                    text2: 'JPG',
                                  ),
                                  const CustomTextWidget(
                                    text1: 'Размер',
                                    text2: 'не более 2 МБ',
                                  ),
                                  const CustomTextWidget(
                                    text1: 'Рекомендуемое разрешение',
                                    text2: 'не менее 720x720 пикселей',
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Длинная сторона изображения не должна превышать короткую более чем в два раза.',
                                        style: TextStyle(
                                          color: Colors.white
                                              .withOpacity(0.699999988079071),
                                          fontSize: 12,
                                          fontFamily: 'Futura PT',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        'Снимок должен быть ярким и четким.',
                                        style: TextStyle(
                                          color: Colors.white
                                              .withOpacity(0.699999988079071),
                                          fontSize: 12,
                                          fontFamily: 'Futura PT',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const CustomTextWidget(
                                    text1: 'Ракурс',
                                    text2: 'фас; без очков и маски; пустой фон',
                                  ),
                                  const SizedBox(height: 16),
                                  const PopupMenu(),
                                  const SizedBox(height: 16),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 56,
                                    child: ElevatedButton.icon(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      icon: SvgPicture.asset(
                                        'assets/icons/biometrics.svg',
                                      ),
                                      label: const Text(
                                        'Подключить биометрию',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFF1B1717),
                                          fontSize: 16,
                                          fontFamily: 'Futura PT',
                                          fontWeight: FontWeight.w500,
                                          height: 0.08,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                ],
                              )
                            else
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  !state.isAuth
                                      ? GestureDetector(
                                          onTap: () {
                                            context
                                                .read<ProfileCubit>()
                                                .saveImage();
                                          },
                                          child: const Text(
                                            'Изменить фото',
                                            style: TextStyle(
                                              color: Color(0xFF10B9C5),
                                              fontSize: 16,
                                              fontFamily: 'Futura PT',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        )
                                      : const SizedBox(),
                                  PopupMenu(isProfile: state.isAuth),
                                  SizedBox(height: !state.isAuth ? 16 : 0),
                                  !state.isAuth
                                      ? SizedBox(
                                          width: double.infinity,
                                          height: 56,
                                          child: ElevatedButton.icon(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                            icon: SvgPicture.asset(
                                              'assets/icons/biometrics.svg',
                                            ),
                                            label: const Text(
                                              'Подключить биометрию',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFF1B1717),
                                                fontSize: 16,
                                                fontFamily: 'Futura PT',
                                                fontWeight: FontWeight.w500,
                                                height: 0.08,
                                              ),
                                            ),
                                          ),
                                        )
                                      : const SizedBox(),
                                  const SizedBox(height: 16),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  if (state.isAuth) {
                    return const ProfilePassport();
                  } else {
                    return const ProfileUser();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
