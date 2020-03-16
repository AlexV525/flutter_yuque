///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/3/16 16:57
///
import 'package:flutter/material.dart';

import 'package:yuque/constants/constants.dart';

class Themes {
  const Themes._();

  static ThemeData get theme => ThemeData(
        primarySwatch: Color(0xff25b864).swatch,
        cursorColor: C.themeColor,
      );
}
