import 'package:carnagef_alpha/config/app.dart';
import 'package:carnagef_alpha/config/app_bindings.dart';
import 'package:carnagef_alpha/config/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  /// Make sure that all flutter bindings initialized
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// Show native splash from native android
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// Setup environment, dev, sit, uat , or production
  /// For now available environment is only dev
  AppEnvironment.setupEnv(Environment.dev);

  /// Init local directory for Hive/Local database
  var appDir = await getApplicationDocumentsDirectory();
  Hive.init(appDir.path);

  /// Call all app bindings in [app_bindings.dart]
  final appBindings = AppBindings();
  await appBindings.dependencies();

  /// Dismiss native splash once all task above executed and finished
  FlutterNativeSplash.remove();

  /// Run main App
  runApp(const App());
}