import 'package:plasticdiver/services/leaderboard_service.dart';
import 'package:plasticdiver/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:plasticdiver/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:plasticdiver/ui/views/about/about_view.dart';
import 'package:plasticdiver/ui/views/game/game_view.dart';
import 'package:plasticdiver/ui/views/home/home_view.dart';
import 'package:plasticdiver/ui/views/leaderboard/leaderboard_view.dart';
import 'package:plasticdiver/ui/views/plastidex/plastidex_view.dart';
import 'package:plasticdiver/ui/views/settings/settings_view.dart';
import 'package:plasticdiver/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
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
