import 'package:dive_game/game/dive_game.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.setLandscape();
  await Flame.device.fullScreen();

  runApp(GameWidget(
    game: DiveGame(),
    autofocus: true,
    // TODO initialActiveOverlays: [],
    // TODO overlayBuilderMap:
  ));
}
