import 'package:plasticdiver/game/components/components.dart';

class HouseholdCleanerBottle extends Garbage {
  HouseholdCleanerBottle({
    super.position,
    super.size,
    super.anchor,
  });

  @override
  String get image => 'household_cleaner_bottle.png';

  @override
  int get points => 10;

  @override
  int get collectionTimeInSeconds => 2;
}
