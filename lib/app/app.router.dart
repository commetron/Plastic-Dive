// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i12;
import 'package:stacked/stacked.dart' as _i11;
import 'package:stacked_services/stacked_services.dart' as _i10;

import '../ui/views/about/about_view.dart' as _i5;
import '../ui/views/after_game/after_game_view.dart' as _i7;
import '../ui/views/game/game_view.dart' as _i2;
import '../ui/views/home/home_view.dart' as _i1;
import '../ui/views/how_to_play/how_to_play_view.dart' as _i9;
import '../ui/views/infocean/infocean_view.dart' as _i6;
import '../ui/views/leaderboard/leaderboard_view.dart' as _i3;
import '../ui/views/level_up_diver/level_up_diver_view.dart' as _i8;
import '../ui/views/settings/settings_view.dart' as _i4;
import 'custom_route_transition.dart' as _i13;

final stackedRouter = StackedRouterWeb(navigatorKey: _i10.StackedService.navigatorKey);

class StackedRouterWeb extends _i11.RootStackRouter {
  StackedRouterWeb({_i12.GlobalKey<_i12.NavigatorState>? navigatorKey}) : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    HomeViewRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeView(),
        transitionsBuilder: _i13.CustomRouteTransition.sharedAxis,
        opaque: true,
        barrierDismissible: false,
      );
    },
    GameViewRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.GameView(),
        transitionsBuilder: _i13.CustomRouteTransition.sharedAxis,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LeaderboardViewRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.LeaderboardView(),
        transitionsBuilder: _i13.CustomRouteTransition.sharedAxis,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SettingsViewRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.SettingsView(),
        transitionsBuilder: _i13.CustomRouteTransition.sharedAxis,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AboutViewRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.AboutView(),
        transitionsBuilder: _i13.CustomRouteTransition.sharedAxis,
        opaque: true,
        barrierDismissible: false,
      );
    },
    InfoceanViewRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.InfoceanView(),
        transitionsBuilder: _i13.CustomRouteTransition.sharedAxis,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AfterGameViewRoute.name: (routeData) {
      final args = routeData.argsAs<AfterGameViewArgs>();
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: _i7.AfterGameView(
          isWon: args.isWon,
          score: args.score,
          key: args.key,
        ),
        transitionsBuilder: _i13.CustomRouteTransition.sharedAxis,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LevelUpDiverViewRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i8.LevelUpDiverView(),
        transitionsBuilder: _i13.CustomRouteTransition.sharedAxis,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HowToPlayViewRoute.name: (routeData) {
      final args = routeData.argsAs<HowToPlayViewArgs>();
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: _i9.HowToPlayView(
          goToGameOnComplete: args.goToGameOnComplete,
          key: args.key,
        ),
        transitionsBuilder: _i13.CustomRouteTransition.sharedAxis,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(
          HomeViewRoute.name,
          path: '/',
        ),
        _i11.RouteConfig(
          GameViewRoute.name,
          path: '/play',
        ),
        _i11.RouteConfig(
          LeaderboardViewRoute.name,
          path: '/leaderboard',
        ),
        _i11.RouteConfig(
          SettingsViewRoute.name,
          path: '/settings',
        ),
        _i11.RouteConfig(
          AboutViewRoute.name,
          path: '/about',
        ),
        _i11.RouteConfig(
          InfoceanViewRoute.name,
          path: '/infocean',
        ),
        _i11.RouteConfig(
          AfterGameViewRoute.name,
          path: '/well-played',
        ),
        _i11.RouteConfig(
          LevelUpDiverViewRoute.name,
          path: '/level-up',
        ),
        _i11.RouteConfig(
          HowToPlayViewRoute.name,
          path: '/how-to-play',
        ),
      ];
}

/// generated route for
/// [_i1.HomeView]
class HomeViewRoute extends _i11.PageRouteInfo<void> {
  const HomeViewRoute()
      : super(
          HomeViewRoute.name,
          path: '/',
        );

  static const String name = 'HomeView';
}

/// generated route for
/// [_i2.GameView]
class GameViewRoute extends _i11.PageRouteInfo<void> {
  const GameViewRoute()
      : super(
          GameViewRoute.name,
          path: '/play',
        );

  static const String name = 'GameView';
}

/// generated route for
/// [_i3.LeaderboardView]
class LeaderboardViewRoute extends _i11.PageRouteInfo<void> {
  const LeaderboardViewRoute()
      : super(
          LeaderboardViewRoute.name,
          path: '/leaderboard',
        );

  static const String name = 'LeaderboardView';
}

/// generated route for
/// [_i4.SettingsView]
class SettingsViewRoute extends _i11.PageRouteInfo<void> {
  const SettingsViewRoute()
      : super(
          SettingsViewRoute.name,
          path: '/settings',
        );

  static const String name = 'SettingsView';
}

/// generated route for
/// [_i5.AboutView]
class AboutViewRoute extends _i11.PageRouteInfo<void> {
  const AboutViewRoute()
      : super(
          AboutViewRoute.name,
          path: '/about',
        );

  static const String name = 'AboutView';
}

/// generated route for
/// [_i6.InfoceanView]
class InfoceanViewRoute extends _i11.PageRouteInfo<void> {
  const InfoceanViewRoute()
      : super(
          InfoceanViewRoute.name,
          path: '/infocean',
        );

  static const String name = 'InfoceanView';
}

/// generated route for
/// [_i7.AfterGameView]
class AfterGameViewRoute extends _i11.PageRouteInfo<AfterGameViewArgs> {
  AfterGameViewRoute({
    required bool isWon,
    int? score,
    _i12.Key? key,
  }) : super(
          AfterGameViewRoute.name,
          path: '/well-played',
          args: AfterGameViewArgs(
            isWon: isWon,
            score: score,
            key: key,
          ),
        );

  static const String name = 'AfterGameView';
}

class AfterGameViewArgs {
  const AfterGameViewArgs({
    required this.isWon,
    this.score,
    this.key,
  });

  final bool isWon;

  final int? score;

  final _i12.Key? key;

  @override
  String toString() {
    return 'AfterGameViewArgs{isWon: $isWon, score: $score, key: $key}';
  }
}

/// generated route for
/// [_i8.LevelUpDiverView]
class LevelUpDiverViewRoute extends _i11.PageRouteInfo<void> {
  const LevelUpDiverViewRoute()
      : super(
          LevelUpDiverViewRoute.name,
          path: '/level-up',
        );

  static const String name = 'LevelUpDiverView';
}

/// generated route for
/// [_i9.HowToPlayView]
class HowToPlayViewRoute extends _i11.PageRouteInfo<HowToPlayViewArgs> {
  HowToPlayViewRoute({
    required bool goToGameOnComplete,
    _i12.Key? key,
  }) : super(
          HowToPlayViewRoute.name,
          path: '/how-to-play',
          args: HowToPlayViewArgs(
            goToGameOnComplete: goToGameOnComplete,
            key: key,
          ),
        );

  static const String name = 'HowToPlayView';
}

class HowToPlayViewArgs {
  const HowToPlayViewArgs({
    required this.goToGameOnComplete,
    this.key,
  });

  final bool goToGameOnComplete;

  final _i12.Key? key;

  @override
  String toString() {
    return 'HowToPlayViewArgs{goToGameOnComplete: $goToGameOnComplete, key: $key}';
  }
}

extension RouterStateExtension on _i10.RouterService {
  Future<dynamic> navigateToHomeView({void Function(_i11.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToGameView({void Function(_i11.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const GameViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToLeaderboardView({void Function(_i11.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const LeaderboardViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToSettingsView({void Function(_i11.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const SettingsViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToAboutView({void Function(_i11.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const AboutViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToInfoceanView({void Function(_i11.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const InfoceanViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToAfterGameView({
    required bool isWon,
    int? score,
    _i12.Key? key,
    void Function(_i11.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      AfterGameViewRoute(
        isWon: isWon,
        score: score,
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToLevelUpDiverView({void Function(_i11.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const LevelUpDiverViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToHowToPlayView({
    required bool goToGameOnComplete,
    _i12.Key? key,
    void Function(_i11.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      HowToPlayViewRoute(
        goToGameOnComplete: goToGameOnComplete,
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithHomeView({void Function(_i11.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithGameView({void Function(_i11.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const GameViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithLeaderboardView({void Function(_i11.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const LeaderboardViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithSettingsView({void Function(_i11.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const SettingsViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithAboutView({void Function(_i11.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const AboutViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithInfoceanView({void Function(_i11.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const InfoceanViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithAfterGameView({
    required bool isWon,
    int? score,
    _i12.Key? key,
    void Function(_i11.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      AfterGameViewRoute(
        isWon: isWon,
        score: score,
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithLevelUpDiverView({void Function(_i11.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const LevelUpDiverViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithHowToPlayView({
    required bool goToGameOnComplete,
    _i12.Key? key,
    void Function(_i11.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      HowToPlayViewRoute(
        goToGameOnComplete: goToGameOnComplete,
        key: key,
      ),
      onFailure: onFailure,
    );
  }
}
