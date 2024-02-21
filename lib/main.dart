import 'package:firebase_core/firebase_core.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:plasticdiver/app/app.bottomsheets.dart';
import 'package:plasticdiver/app/app.dialogs.dart';
import 'package:plasticdiver/app/app.locator.dart';
import 'package:plasticdiver/app/app.router.dart';
import 'package:plasticdiver/firebase_options.dart';
import 'package:plasticdiver/ui/common/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Flame
  await Flame.device.setLandscape();
  await Flame.device.fullScreen();

  // Stacked
  await setupLocator(stackedRouter: stackedRouter);
  setupDialogUi();
  setupBottomSheetUi();

  // Flutter
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // AppTheme
      theme: appTheme,

      // Routing
      routerDelegate: stackedRouter.delegate(),
      routeInformationParser: stackedRouter.defaultRouteParser(),
    );
  }
}
