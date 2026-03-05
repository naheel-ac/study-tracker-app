import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:study_tracker/presentation/screens/calender_screen/calender_screen.dart';
import 'package:study_tracker/presentation/screens/focus_screen/focus_screen.dart';
import 'package:study_tracker/presentation/screens/home_screen/home_screen.dart';
import 'package:study_tracker/presentation/screens/profile_screen/profile_screen.dart';

class BtmNavBar extends StatefulWidget {
  const BtmNavBar({super.key});

  @override
  State<BtmNavBar> createState() => _BtmNavBarState();
}

class _BtmNavBarState extends State<BtmNavBar> {
  int currentIndex = 0;

  List<Widget> screens() {
    return [HomeScreen(), FocusScreen(), CalenderScreen(), ProfileScreen()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.transparent,
            border: Border.all(color: Color(0xFF6366F2), width: 0.4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () => setState(() => currentIndex = 0),
                child: SvgPicture.asset(
                  'assets/btmIcons/home1.svg',
                  height: 25,
                  width: 25,
                  colorFilter: ColorFilter.mode(
                    currentIndex == 0
                        ? Colors.white
                        : Colors.white.withOpacity(0.4),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              InkWell(
                onTap: () => setState(() => currentIndex = 1),
                child: SvgPicture.asset(
                  'assets/btmIcons/clock.svg',
                  height: 25,
                  width: 25,
                  colorFilter: ColorFilter.mode(
                    currentIndex == 1
                        ? Colors.white
                        : Colors.white.withOpacity(0.4),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              InkWell(
                onTap: () => setState(() => currentIndex = 2),
                child: SvgPicture.asset(
                  'assets/btmIcons/calender.svg',
                  height: 25,
                  width: 25,
                  colorFilter: ColorFilter.mode(
                    currentIndex == 2
                        ? Colors.white
                        : Colors.white.withOpacity(0.4),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              InkWell(
                onTap: () => setState(() => currentIndex = 3),
                child: SvgPicture.asset(
                  'assets/btmIcons/profile.svg',
                  height: 25,
                  width: 25,
                  colorFilter: ColorFilter.mode(
                    currentIndex == 3
                        ? Colors.white
                        : Colors.white.withOpacity(0.4),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: screens()[currentIndex],
    );
  }
}
