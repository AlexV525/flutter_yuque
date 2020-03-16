///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/3/16 14:17
///
import 'package:flutter/foundation.dart';
import 'package:yuque/constants/constants.dart';

export 'net_utils.dart';

void trueDebugPrint(String message, {int wrapWidth}) {
  if (!kReleaseMode) {
    debugPrint(message, wrapWidth: wrapWidth);
  }
}

int _lastWantToPop = 0;

Future<bool> doubleBackExit() async {
  final int now = DateTime.now().millisecondsSinceEpoch;
  if (now - _lastWantToPop > 800) {
    showToast('再按一次退出应用');
    _lastWantToPop = DateTime.now().millisecondsSinceEpoch;
    return false;
  } else {
    dismissAllToast();
    return true;
  }
}
