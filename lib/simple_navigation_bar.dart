// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/const_colors.dart';
import 'package:test/int_cubit.dart';
import 'package:test/lockers_page.dart';
import 'package:test/svg_pictures.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({Key? key}) : super(key: key);

  @override
  MyNavigationBarState createState() => MyNavigationBarState();
}

class MyNavigationBarState extends State<MyNavigationBar> {
  IntCubit selected = IntCubit(0);
  static const List<Widget> _widgetOptions = <Widget>[
    LockersPage(),
    Text(
      'My friends',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
    Text(
      'Profile',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
  ];

  void _onItemTapped(int index) => selected.setNew(index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        title: SvgPicture.asset(SvgPictures.logo),
        backgroundColor: ConstColors.appBarColor,
        shadowColor: Colors.transparent,
      ),
      body: Center(
        child: BlocBuilder<IntCubit, int>(
            bloc: selected,
            builder: (context, selected) => _widgetOptions.elementAt(selected)),
      ),
      bottomNavigationBar: BlocBuilder<IntCubit, int>(
        bloc: selected,
        builder: (context, selected) => BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                label: "",
                icon: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    SvgPicture.asset(
                      SvgPictures.locker,
                      color: selected == 0
                          ? ConstColors.mainColor.withOpacity(0.7)
                          : ConstColors.darkGrey.withOpacity(0.7),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "My lockers",
                      style: TextStyle(
                          fontWeight:
                              selected == 0 ? FontWeight.w700 : FontWeight.w500,
                          color: selected == 0
                              ? ConstColors.mainColor
                              : ConstColors.darkGrey),
                    ),
                  ],
                ),
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                label: "",
                icon: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    SvgPicture.asset(
                      SvgPictures.friends,
                      color: selected == 1
                          ? ConstColors.mainColor
                          : ConstColors.darkGrey,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "My friends",
                      style: TextStyle(
                          fontWeight:
                              selected == 1 ? FontWeight.w700 : FontWeight.w500,
                          color: selected == 1
                              ? ConstColors.mainColor
                              : ConstColors.darkGrey),
                    ),
                  ],
                ),
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                label: "",
                icon: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    SvgPicture.asset(
                      SvgPictures.gear,
                      color: selected == 2
                          ? ConstColors.mainColor
                          : ConstColors.darkGrey,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(
                          fontWeight:
                              selected == 2 ? FontWeight.w700 : FontWeight.w500,
                          color: selected == 2
                              ? ConstColors.mainColor
                              : ConstColors.darkGrey),
                    )
                  ],
                ),
                backgroundColor: Colors.white,
              ),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: selected,
            selectedItemColor: Colors.black,
            iconSize: 25,
            onTap: _onItemTapped,
            elevation: 5),
      ),
    );
  }
}
