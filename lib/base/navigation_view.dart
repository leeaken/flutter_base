import 'package:flutter/material.dart';

/// navigation tab bar 初始化类
class NavigationView {

  final BottomNavigationBarItem item;
  final AnimationController controller;

  NavigationView({
    Widget icon,
    Widget title,
    TickerProvider vsync
  }):
  
  item = new BottomNavigationBarItem(
    icon: icon,
    title: title,
  ),
  controller = new AnimationController(
    duration: kThemeAnimationDuration,
    vsync: vsync
  );
}