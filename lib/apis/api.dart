///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/3/16 14:19
///
class API {
  const API._();

  static const String baseUri = 'https://www.yuque.com/api/v2';

  static const String hello = '$baseUri/hello';
  static const String selfInfo = '$baseUri/user';
  static String userInfoFromId(String id) => '$baseUri/users/$id';
  static String userInfoFromLoginName(String loginName) => '$baseUri/users/$loginName';
}
