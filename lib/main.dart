import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:plastic_diver/app/app.bottomsheets.dart';
import 'package:plastic_diver/app/app.dialogs.dart';
import 'package:plastic_diver/app/app.locator.dart';
import 'package:plastic_diver/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Flame.device.setLandscape();
  await Flame.device.fullScreen();

  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
