import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peritosapp/app/widget/app.dart';
import 'package:peritosapp/shared/http/http_override.dart';
import 'package:peritosapp/shared/util/platform_type.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  final platformType = detectPlatformType();
  runApp(ProviderScope(overrides: [
    platformTypeProvider.overrideWithValue(platformType),
  ], child: App()));
}
