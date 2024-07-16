import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tz/modules/main/cubit/main_cubit.dart';
import 'package:tz/modules/profile/pages/profile_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainView(
      items: [
        SecondPages(),
        SecondPages(),
        SecondPages(),
        SecondPages(),
        ProfilePage(),
      ],
    );
  }
}

class MainView extends StatelessWidget {
  const MainView({super.key, required this.items});

  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: items[context.watch<MainCubit>().state],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: context.read<MainCubit>().change,
        backgroundColor: const Color(0xffD68FB7),
        indicatorColor: Colors.white,
        selectedIndex: context.watch<MainCubit>().state,
        destinations: <Widget>[
          NavigationDestination(
            icon: SvgPicture.asset('assets/icons/home.svg'),
            label: 'Главная',
          ),
          NavigationDestination(
            icon: SvgPicture.asset('assets/icons/programm.svg'),
            label: 'Программа',
          ),
          NavigationDestination(
            icon: SvgPicture.asset('assets/icons/qr_scan.svg'),
            label: 'QR-сканер',
          ),
          NavigationDestination(
            icon: SvgPicture.asset('assets/icons/tasks.svg'),
            label: 'Задания',
          ),
          NavigationDestination(
            icon: SvgPicture.asset('assets/icons/profile.svg'),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}

class SecondPages extends StatelessWidget {
  const SecondPages({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
