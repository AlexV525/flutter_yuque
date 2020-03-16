///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/3/16 16:50
///
import 'package:yuque/constants/constants.dart';

mixin InputCheckMixin {
  bool checkInputEmpty(String input, [String tip]) {
    if (input == null || input.trim().isEmpty) {
      if (tip != null) {
        showToast(tip);
      }
      return false;
    }
    return true;
  }

  String makeEmptyTip(String name) {
    return "The $name mustn't be null.";
  }
}
