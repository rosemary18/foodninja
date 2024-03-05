import 'package:flutter/material.dart';
import 'package:food_ninja/src/cores/index.dart';
import 'package:food_ninja/src/widgets/index.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigation extends StatelessWidget {
  final int tabIndex;
  final Function(int)? onTabChange;
  const BottomNavigation({
    super.key,
    this.tabIndex = 0,
    this.onTabChange,
  });

  renderLeadingImage(String image, int tab) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AnimatedOpacity(
          opacity: tabIndex == tab ? 1 : .4,
          duration: const Duration(milliseconds: 300),
          child: Image.asset(
            image,
            height: 20,
            width: 20,
          )
        ),
        if (tab == 1 || tab == 2) const Positioned(
          top: -2,
          right: -2,
          child: Dot()
        )
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Color(0xFF252525),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: GNav(
              selectedIndex: tabIndex,
              // rippleColor: Colors.grey[800]!, // tab button ripple color when pressed
              // hoverColor: Colors.grey[700]!, // tab button hover color
              haptic: true, // haptic feedback
              tabBorderRadius: 12,
              // tabActiveBorder: Border.all(color: Colors.black, width: 1), // tab button border
              // tabBorder: Border.all(color: Colors.grey, width: 1), // tab button border
              // tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)], // tab button shadow
              curve: Curves.easeInOut, // tab animation curves
              duration: const Duration(milliseconds: 300), // tab animation duration
              gap: 12, // the tab button gap between icon and text
              color: Colors.grey[800], // unselected icon color
              // activeColor: Colors.purple, // selected icon and text color
              iconSize: 24, // tab button icon size
              // tabBackgroundColor: Colors.purple.withOpacity(0.1), // selected tab background color
              // activeColor: Colors.amber,
              padding: const EdgeInsets.all(12),
              tabBackgroundColor: Colors.green.withOpacity(.15),
              textStyle: const TextStyle(
                  color: Colors.white, fontFamily: "BentonSans-Medium"),
              onTabChange: onTabChange,
              tabs: [
                GButton(
                  icon: Icons.close,
                  leading: renderLeadingImage(appIcons["IC_HOME"]!, 0),
                  text: "Home",
                  iconColor: Colors.white,
                ),
                GButton(
                  icon: Icons.close,
                  leading: renderLeadingImage(appIcons["IC_CART"]!, 1),
                  text: "Cart",
                  iconColor: Colors.white,
                ),
                GButton(
                  icon: Icons.close,
                  leading: renderLeadingImage(appIcons["IC_CHAT"]!, 2),
                  text: "Chat",
                  iconColor: Colors.white,
                ),
                GButton(
                  icon: Icons.close,
                  leading: renderLeadingImage(appIcons["IC_PROFILE"]!, 3),
                  text: "Profile",
                  iconColor: Colors.white,
                ),
              ]),
        ));
  }
}
