import 'package:flutter/widgets.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:plasticdive/app/app.locator.dart';
import 'package:plasticdive/app/app.router.dart';
import 'package:plasticdive/services/shared_preferences_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HowToPlayViewModel extends BaseViewModel {
  final _sharedPreferencesService = locator<SharedPreferencesService>();
  final _navigationService = locator<NavigationService>();

  final bool goToGameOnComplete;

  final GlobalKey<IntroductionScreenState> introScreenKey = GlobalKey<IntroductionScreenState>();

  HowToPlayViewModel({this.goToGameOnComplete = false});

  Future completeHowToPlay() async {
    await _sharedPreferencesService.setHasSeenHowToPlay(true);

    if (goToGameOnComplete) {
      return await _navigationService.replaceWithGameView();
    }

    return _navigationService.back();
  }

  Future skipToLastPage() async {
    await introScreenKey.currentState?.skipToEnd();
  }

  void goToNextPage() {
    introScreenKey.currentState?.next();
  }
}
