///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/3/16 17:22
///
import 'package:yuque/constants/constants.dart';

UserInfo get currentUser => UserAPI.userInfo;

class UserAPI {
  const UserAPI._();

  static String token;
  static UserInfo userInfo = UserInfo();
}
