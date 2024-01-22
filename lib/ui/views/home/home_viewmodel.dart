import 'package:plasticdiver/app/app.locator.dart';
import 'package:plasticdiver/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  Future switchSound() async {}

  Future navigateToGame() async {
    return await _navigationService.navigateToGameView();
  }

  Future navigateToSettings() async {
    return await _navigationService.navigateToSettingsView();
  }

  Future navigateToAbout() async {
    return await _navigationService.navigateToAboutView();
  }

  Future navigateToPlastidex() async {
    return await _navigationService.navigateToPlastidexView();
  }

  Future navigateToLeaderboard() async {
    return await _navigationService.navigateToLeaderboardView();
  }

  // TODO remove
  void showDialog() {
    // _dialogService.showCustomDialog(
    //   variant: DialogType.infoAlert,
    //   title: 'Stacked Rocks!',
    //   description: 'Give stacked $_counter stars on Github',
    // );
  }

  // TODO remove
  void showBottomSheet() {
    // _bottomSheetService.showCustomSheet(
    //   variant: BottomSheetType.notice,
    //   title: ksHomeBottomSheetTitle,
    //   description: ksHomeBottomSheetDescription,
    // );
  }
}
