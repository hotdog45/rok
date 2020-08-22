import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_i18n/loaders/file_translation_loader.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:orientation/orientation.dart';

import 'common/unils/app_init_utils.dart';
import 'page/common/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  OrientationPlugin.setPreferredOrientations(DeviceOrientation.values);
  OrientationPlugin.setEnabledSystemUIOverlays(SystemUiOverlay.values);

  final FlutterI18nDelegate flutterI18nDelegate = FlutterI18nDelegate(
    translationLoader: FileTranslationLoader(
        useCountryCode: false,
        fallbackFile: 'zh',
        basePath: 'assets/i18n',
        forcedLocale: Locale('zh')),
  );

  await flutterI18nDelegate.load(null);
  appInitUtils.initEasyLoading();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  appInitUtils.initAndroidSystemUI();
  runApp(MyApp(flutterI18nDelegate));
}

class MyApp extends StatelessWidget {
  final FlutterI18nDelegate flutterI18nDelegate;

  MyApp(this.flutterI18nDelegate);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: appInitUtils.appRoutes(),
        debugShowCheckedModeBanner: !kReleaseMode,
        theme: appInitUtils.initThemeData(),
        localizationsDelegates: [
          flutterI18nDelegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        initialRoute: WelcomePage.sName);
  }
}
