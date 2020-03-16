///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020-02-13 17:31
///
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:yuque/constants/constants.dart';

class NetUtils {
  const NetUtils._();

  static Future<dynamic> fetch(
    FetchType fetchType, {
    @required Uri uri,
    dynamic body,
    Map<String, String> headers,
  }) async {
    http.Response response;
    if (headers == null) headers = <String, String>{};
    headers['User-Agent'] = 'flutter-yuque';
    headers['X-Auth-Token'] = UserAPI.token;
    switch (fetchType) {
      case FetchType.get:
        response = await http.get(uri, headers: headers);
        break;
      case FetchType.post:
        response = await http.post(uri, body: jsonEncode(body), headers: headers);
        break;
    }
    try {
      return jsonDecode(response.body)['data'];
    } catch (e) {
      return response;
    }
  }
}

enum FetchType { get, post }
