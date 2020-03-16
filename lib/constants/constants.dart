///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/3/16 14:10
///
import 'package:flutter/material.dart';

export 'package:oktoast/oktoast.dart';
export 'package:provider/provider.dart';

export 'colors.dart';
export 'instances.dart';
export 'resources.dart';
export 'screens.dart';
export 'themes.dart';

export 'package:yuque/apis/api.e.dart';
export 'package:yuque/extensions/extensions.e.dart';
export 'package:yuque/models/models.e.dart';
export 'package:yuque/pages/pages.e.dart';
export 'package:yuque/providers/providers.dart';
export 'package:yuque/utils/utils.e.dart';
export 'package:yuque/widgets/widget.e.dart';

const double kAppBarHeight = 75.0;

/// Constants for runtime.
/// 运行环境常量类
class Constants {
  const Constants._();
}

/// No glow when scrolling a [ScrollView].
/// 滚动滚动部件时关闭边缘发光效果
class NoGlowScrollBehavior extends ScrollBehavior {
  const NoGlowScrollBehavior();

  @override
  Widget buildViewportChrome(BuildContext _, Widget child, AxisDirection __) => child;
}
