import 'package:bengaluru_fc/Screens/more.dart';
import 'package:bengaluru_fc/Screens/news.dart';
import 'package:bengaluru_fc/Screens/Explore.dart';
import 'package:bengaluru_fc/Screens/watch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  PersistentTabController _controller;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  List<Widget> _buildScreens() {
    return [
      NewsScreen(
        title: "Bengaluru FC",
      ),
      Watchpage(
        title: "BFC TV",
      ),
      ExploreScreen(
        title: "Explore",
      ),
      MoreScreen(
        title: "More",
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(
          Ionicons.ios_football,
          size: 22,
        ),
        title: ("Follow"),
        activeColor: CupertinoColors.white,
        inactiveColor: Colors.white70,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          LineAwesomeIcons.play,
          size: 22,
        ),
        title: ("Watch"),
        activeColor: CupertinoColors.white,
        inactiveColor: Colors.white70,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          LineAwesomeIcons.search,
          size: 22,
        ),
        title: ("Explore"),
        activeColor: CupertinoColors.white,
        inactiveColor: Colors.white70,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          MaterialCommunityIcons.dots_horizontal_circle_outline,
          size: 22,
        ),
        title: ("More"),
        activeColor: CupertinoColors.white,
        inactiveColor: Colors.white70,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      navBarHeight: 60,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Color(0xFF011589),
      resizeToAvoidBottomInset: true,
      stateManagement: false,
      hideNavigationBarWhenKeyboardShows: true,
      popAllScreensOnTapOfSelectedTab: false,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: false,
      ),
      navBarStyle: NavBarStyle.style12,
      //3,9
    );
  }
}
