import 'package:e_learning_app/features/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_lazy_indexed_stack/flutter_lazy_indexed_stack.dart';
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
    const HomeView(),
    Container(
      color: AppColors.secondaryColor,
    ),
    Container(
      color: AppColors.secondaryColor,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        
        key: _bottomNavigationKey,
        height: kBottomNavigationBarHeight,
        backgroundColor: AppColors.primaryColor,
        items: [
          Icon(
            Icons.home,
            size: 30,
            color: _page != 0 ? Colors.black : AppColors.primaryColor,
          ),
          Icon(
            Icons.list,
            size: 30,
            color: _page != 1 ? Colors.black : AppColors.primaryColor,
          ),
          Icon(
            Icons.person,
            size: 30,
            color: _page != 2 ? Colors.black : AppColors.primaryColor,
          ),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: LazyIndexedStack(
        index: _page,
        children: buildScreens,
      ),
    );
  }
}
