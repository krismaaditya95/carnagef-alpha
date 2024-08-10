import 'package:carnagef_alpha/config/env.dart';
import 'package:carnagef_alpha/config/routes/app_pages.dart';
import 'package:carnagef_alpha/config/theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppEnvironment.title,
      debugShowCheckedModeBanner: (AppEnvironment.environment == Environment.dev),
      enableLog: (AppEnvironment.environment != Environment.prod),
      initialRoute: initialPageRoute,
      getPages: pageRoutes,
      unknownRoute: Get.currentRoute.isEmpty ? splashScreenPage : null,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      theme: AppThemes.defaultTheme(context),
      // home: MyHomePage(title: AppEnvironment.title),
      builder: ((context, child){
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
            child: Navigator(
              onGenerateRoute: (settings) => MaterialPageRoute(
                  builder: (_) => child ?? const SizedBox()
              ),
            )
        );
      }),
    );
  }
}
