import 'package:flutter/material.dart';
import 'package:plasticdive/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'about_viewmodel.dart';

class AboutView extends StackedView<AboutViewModel> {
  const AboutView({super.key});

  @override
  Widget builder(
    BuildContext context,
    AboutViewModel viewModel,
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
        Scaffold(
          appBar: AppBar(
            title: const Text('About'),
          ),
          body: SingleChildScrollView(
            padding: getResponsivePadding(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Plastic Diver',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                verticalSpaceSmall,
                Text(
                  'Version: 1.0.0',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                verticalSpaceSmall,
                Text(
                  'Developed by Marie & Chris with ❤️',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                verticalSpaceMedium,
                Image.asset(
                  "assets/images/screens-backgrounds/about.png",
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
                verticalSpaceLarge,
                Text(
                  'We are proud to present our very first game. We hope you enjoy it! We know it\'s not perfect, but we are working hard to improve it.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                verticalSpaceLarge,
                Text(
                  'Special thanks to:',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                verticalSpaceSmall,
                Text(
                  'Our earth for being so beautiful and inspiring us to create this game. Let\'s not forget to protect it!',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                verticalSpaceSmall,
                Text(
                  'Our friends testing the game and giving us feedback. (You know who you are! Even if you didn\'t test it, you are still our friend!)',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                verticalSpaceSmall,
                Text(
                  'Flutter, Flame, Stacked for their frameworks helping us to shape our crazy ideas into a game. Global Citizen for their challenge idea and inspiration.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                verticalSpaceSmall,
                Text(
                  'Freepik and DALL-E for the amazing icons and images we used in our game. (We are still working on our own art skills! 😅)',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                verticalSpaceSmall,
                Text(
                  'And last but not least, you for playing our game!',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  '© 2024',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  AboutViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AboutViewModel();
}
