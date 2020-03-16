///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/3/16 15:41
///
import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:yuque/constants/constants.dart';

NavigatorState get navigatorState => Instances.navigatorKey.currentState;

BuildContext get currentContext => navigatorState.context;

ThemeData get currentTheme => currentContext.themeData;

Brightness get currentBrightness => currentTheme.brightness;

Color get currentThemeColor => currentTheme.accentColor;

bool get currentIsDark => currentBrightness == Brightness.dark;

int moreThanZero(num value) => math.max(0, value);

int moreThanOne(num value) => math.max(1, value);

int get currentTimeStamp => DateTime.now().millisecondsSinceEpoch;

class Instances {
  const Instances._();

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static AppLifecycleState appLifeCycleState = AppLifecycleState.resumed;
}
