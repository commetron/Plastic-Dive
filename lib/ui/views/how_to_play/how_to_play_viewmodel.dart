import 'package:flutter/widgets.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:plasticdiver/app/app.locator.dart';
import 'package:plasticdiver/app/app.router.dart';
import 'package:plasticdiver/services/shared_preferences_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HowToPlayViewModel extends BaseViewModel {
  final _sharedPreferencesService = locator<SharedPreferencesService>();
  final _routerService = locator<RouterService>();

  final bool goToGameOnComplete;

  final GlobalKey<IntroductionScreenState> introScreenKey = GlobalKey<IntroductionScreenState>();

  HowToPlayViewModel({this.goToGameOnComplete = false});

  Future completeHowToPlay() async {
    await _sharedPreferencesService.setHasSeenHowToPlay(true);

    if (goToGameOnComplete) {
      return await _routerService.replaceWithGameView();
    }

    return _routerService.back();
  }

  Future skipToLastPage() async {
    await introScreenKey.currentState?.skipToEnd();
  }

  void goToNextPage() {
    introScreenKey.currentState?.next();
  }
}
