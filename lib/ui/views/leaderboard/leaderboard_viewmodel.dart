import 'package:plasticdiver/app/app.locator.dart';
import 'package:plasticdiver/services/leaderboard_service.dart';
import 'package:stacked/stacked.dart';

class LeaderboardViewModel extends FutureViewModel<List<LeaderboardEntry>> {
  final _leaderboardService = locator<LeaderboardService>();

  @override
  Future<List<LeaderboardEntry>> futureToRun() =>
      _leaderboardService.getLeaderboard();
}
