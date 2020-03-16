import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:yuque/constants/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Themes.theme,
      child: OKToast(
        child: MaterialApp(
          title: 'Flutter Demo',
          navigatorKey: Instances.navigatorKey,
          theme: Themes.theme,
          builder: (BuildContext c, Widget w) {
            ScreenUtil.init(c, allowFontScaling: true);
            return ScrollConfiguration(
              behavior: const NoGlowScrollBehavior(),
              child: NoScaleTextWidget(child: w),
            );
          },
          home: ChangeNotifierProvider.value(
            value: LoginProvider(),
            child: LoginPage(),
          ),
        ),
      ),
    );
  }
}
