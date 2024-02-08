import 'package:flutter/material.dart';
import 'package:plasticdiver/ui/common/app_theme.dart';
import 'package:plasticdiver/ui/common/ui_helpers.dart';
import 'package:plasticdiver/ui/widgets/common/game_button/game_button.dart';

class LevelBar extends StatelessWidget {
  static const int maxLevel = 5;
  final String skillName;
  final int level;
  final VoidCallback? onUpgrade;
  final bool isUpgradeAllowed;

  const LevelBar({
    required this.skillName,
    required this.level,
    this.onUpgrade,
    required this.isUpgradeAllowed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          skillName,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        horizontalSpaceMedium,
        Expanded(child: LinearProgressIndicator(value: level / maxLevel, borderRadius: BorderRadius.circular(10))),
        horizontalSpaceMedium,
        GameButton(
          onPressed: isUpgradeAllowed && level < maxLevel ? onUpgrade : null,
          size: 30,
          child: Text('Upgrade', style: smallButtonTextStyle),
        ),
      ],
    );
  }
}
