import 'dart:async';

import 'package:flutter/material.dart';
import 'package:trending_list/app/app.dart';
import 'package:trending_list/core/injector/injector.dart' as di;

void main() {
  runZonedGuarded(() async {
    await di.init();
    runApp(const App());
  }, (error, stack) {});
}
