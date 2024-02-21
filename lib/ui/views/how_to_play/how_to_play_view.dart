import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:plasticdiver/ui/common/app_colors.dart';
import 'package:plasticdiver/ui/common/app_theme.dart';
import 'package:plasticdiver/ui/common/ui_helpers.dart';
import 'package:plasticdiver/ui/widgets/common/game_button/game_button.dart';
import 'package:stacked/stacked.dart';

import 'how_to_play_viewmodel.dart';

class HowToPlayView extends StackedView<HowToPlayViewModel> {
  final bool goToGameOnComplete;

  const HowToPlayView({required this.goToGameOnComplete, super.key});

  @override
  Widget builder(
    BuildContext context,
    HowToPlayViewModel viewModel,
    Widget? child,
  ) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/screens-backgrounds/home.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        IntroductionScreen(
          key: viewModel.introScreenKey,
          pages: listPagesViewModel(context),
          bodyPadding: getResponsivePadding(context),
          globalBackgroundColor: Colors.transparent,
          showNextButton: true,
          showSkipButton: true,
          dotsDecorator: DotsDecorator(
            size: const Size(20.0, 20.0),
            color: Colors.white.withOpacity(0.7),
            activeColor: kcPrimaryColor,
            activeSize: const Size(40.0, 20.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          skip: GameButton(
            onPressed: viewModel.skipToLastPage,
            size: 50,
            child: const Text('Skip', style: buttonTextStyle),
          ),
          next: GameButton(
            onPressed: viewModel.goToNextPage,
            size: 50,
            child: const Text('Next', style: buttonTextStyle),
          ),
          done: GameButton(
            onPressed: viewModel.completeHowToPlay,
            size: 50,
            child: const Text('Done', style: buttonTextStyle),
          ),
          onDone: viewModel.completeHowToPlay,
        ),
      ],
    );
  }

  PageDecoration getDecoration(BuildContext context) => PageDecoration(
        bodyTextStyle: Theme.of(context).textTheme.bodyLarge!,
        titleTextStyle: Theme.of(context).textTheme.titleLarge!,
      );

  List<PageViewModel> listPagesViewModel(BuildContext context) => [
        PageViewModel(
          title: "Welcome, little diver!",
          body: "You're about to discover the wonders of the oceans, but beware, some might surprise you!",
          image: Image.asset("assets/images/how-to-play/howtoplay1.png", height: quarterScreenWidth(context)),
          decoration: getDecoration(context),
        ),
        PageViewModel(
          title: "Your mission",
          body:
              "Collect as much trash as possible before resurfacing. Keep an eye on your oxygen! The more trash you collect, the more points you get... and help the earth! With the points, you can upgrade your diver!",
          image: Image.asset("assets/images/how-to-play/howtoplay2.png", height: quarterScreenWidth(context)),
          decoration: getDecoration(context),
        ),
        PageViewModel(
          title: "How to dive?",
          body:
              "To navigate, use the joystick or the arrow keys on your keyboard. To collect trash, use the button or the space bar. Be careful, the larger the trash, the more time it will take you.",
          image: Image.asset("assets/images/how-to-play/howtoplay3.png", height: quarterScreenWidth(context)),
          decoration: getDecoration(context),
        ),
      ];

  @override
  HowToPlayViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HowToPlayViewModel(goToGameOnComplete: goToGameOnComplete);
}
