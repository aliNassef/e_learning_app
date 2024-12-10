import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../../../core/utils/app_color.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});
  static const String routeName = 'layout';

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  List<Widget> buildScreens = [
    Container(
      color: AppColors.primaryColor,
    ),
    Container(
      color: AppColors.lightsecondaryColor,
    ),
    Container(
      color: AppColors.secondaryColor,
    ),
  ];
  Widget buildScreen(int index) {
    return buildScreens[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        height: kBottomNavigationBarHeight,
        backgroundColor: AppColors.primaryColor,
        items: const [
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: buildScreen(_page),
    );
  }
}
