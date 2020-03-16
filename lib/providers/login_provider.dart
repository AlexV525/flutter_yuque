///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/3/16 16:29
///
import 'package:flutter/material.dart';
import 'package:yuque/constants/constants.dart';

class LoginProvider extends ChangeNotifier {
  bool _isLogin = false;

  bool get isLogin => _isLogin;

  set isLogin(bool value) {
    assert(value != null);
    if (value == _isLogin) return;
    _isLogin = value;
    notifyListeners();
  }

  Future<void> requestLogin(String token) async {
    isLogin = true;
    try {
      final Map<String, dynamic> info =
          await NetUtils.fetch(FetchType.get, uri: Uri.parse(API.selfInfo));
      UserAPI.token = token;
      UserAPI.userInfo = UserInfo.fromJson(info);
    } catch (e) {
      trueDebugPrint('Error when request login: $e');
    } finally {
      isLogin = false;
    }
  }
}
