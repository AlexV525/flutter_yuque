///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/3/16 16:27
///
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:yuque/constants/constants.dart';

export 'login_provider.dart';

ChangeNotifierProvider<T> buildProvider<T extends ChangeNotifier>(T value) {
  return ChangeNotifierProvider<T>.value(value: value);
}

List<SingleChildWidget> get providers => _providers;

final _providers = [
  buildProvider<LoginProvider>(LoginProvider()),
];
