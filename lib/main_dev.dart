import 'package:carnagef_alpha/config/app.dart';
import 'package:carnagef_alpha/config/app_bindings.dart';
import 'package:carnagef_alpha/config/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  AppEnvironment.setupEnv(Environment.dev);

  var appDir = await getApplicationDocumentsDirectory();
  Hive.init(appDir.path);

  final appBindings = AppBindings();
  await appBindings.dependencies();

  FlutterNativeSplash.remove();
  runApp(const App());
}