import 'package:plastic_diver/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:plastic_diver/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:plastic_diver/ui/views/home/home_view.dart';
import 'package:plastic_diver/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:plastic_diver/ui/views/game/game_view.dart';
import 'package:plastic_diver/ui/views/leaderboard/leaderboard_view.dart';
import 'package:plastic_diver/ui/views/settings/settings_view.dart';
import 'package:plastic_diver/ui/views/about/about_view.dart';
import 'package:plastic_diver/ui/views/plastidex/plastidex_view.dart';
import 'package:plastic_diver/services/leaderboard_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: GameView),
    MaterialRoute(page: LeaderboardView),
    MaterialRoute(page: SettingsView),
    MaterialRoute(page: AboutView),
    MaterialRoute(page: PlastidexView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: LeaderboardService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
