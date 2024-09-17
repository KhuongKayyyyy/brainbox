import 'package:brainbox/utils/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key,required this.navigationShell});

  final StatefulNavigationShell navigationShell;
  @override
  _MainWrapperState createState() => _MainWrapperState();
}


class _MainWrapperState extends State<MainWrapper> {
  int _myCurrentIndex = 0;

  void _goToBranch(int index){
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black,
              width: 1
            )
          )
        ),
        height: 90,
        child: WaterDropNavBar(
          backgroundColor: Colors.white,
          selectedIndex: _myCurrentIndex,
          onItemSelected: (index) {
            setState(() {
              _myCurrentIndex = index;
              _goToBranch(_myCurrentIndex);
            });
            // pageController.animateToPage(_myCurrentIndex,
            //     duration: const Duration(milliseconds: 400),
            //     curve: Curves.easeOutQuad);
          },
          waterDropColor: Colors.black,
          barItems: [
            BarItem(
              filledIcon: Icons.other_houses_rounded,
              outlinedIcon: Icons.other_houses_outlined,
            ),
            BarItem(
              filledIcon: Icons.add_box,
              outlinedIcon: Icons.add_box_outlined,
            ),
            BarItem(
              filledIcon: Icons.folder,
              outlinedIcon: Icons.folder_outlined,
            ),
            BarItem(
                filledIcon: Icons.person,
                outlinedIcon: Icons.person_outline_rounded),
          ],
        ),
      ),
    );
  }
}
