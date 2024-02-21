import 'package:stacked/stacked.dart';

class InfoceanViewModel extends IndexTrackingViewModel {
  List<InfoceanInfo> get source => currentIndex == 0 ? plasticGarbage : animals;

  final plasticGarbage = [
    InfoceanGarbage('Bottle', 'bottle.png', '450 years'),
    InfoceanGarbage('Household Cleaner', 'household_cleaner_bottle.png', '450 years'),
    InfoceanGarbage('Microplastic', 'microplastic_cloud.png', 'Never'),
    InfoceanGarbage('Plastic bag', 'plastic_bag.png', '10-20 years'),
    InfoceanGarbage('Shampoo bottle', 'shampoo_bottle.png', '450 years'),
    InfoceanGarbage('Soda can', 'soda_can.png', '200-500 years'),
    InfoceanGarbage('Straw', 'straw.png', '200 years'),
  ];

  final animals = [
    InfoceanAnimal('Clown fish', 'clown-fish.png', '5-10 years'),
    InfoceanAnimal('Coral', 'coral-1.png', '100-1000 years'),
    InfoceanAnimal('Exotic fish', 'exotic-fish.png', '5-10 years'),
    InfoceanAnimal('Tuna fish', 'tuna-fish.png', '5-10 years'),
    InfoceanAnimal('Globe fish', 'globe-fish.png', '5-10 years'),
    // InfoceanInfo('Dolphin', 'dolphin.png', '20-25 years'),
    // InfoceanInfo('Jellyfish', 'jellyfish.png', '1 year'),
    // InfoceanInfo('Octopus', 'octopus.png', '1-2 years'),
    // InfoceanInfo('Sea turtle', 'sea_turtle.png', '50-100 years'),
    // InfoceanInfo('Shark', 'shark.png', '20-30 years'),
    // InfoceanInfo('Whale', 'whale.png', '40-90 years'),
  ];
}

abstract class InfoceanInfo {
  final String name;
  final String image;

  String get imagePath => 'assets/images/$imageFolder/$image';
  final String lifeLong;

  String get imageFolder;

  bool get shouldFlip;

  InfoceanInfo(this.name, this.image, this.lifeLong);
}

class InfoceanAnimal extends InfoceanInfo {
  @override
  String get imageFolder => 'animals';

  @override
  bool get shouldFlip => true;

  InfoceanAnimal(super.name, super.image, super.lifeLong);
}

class InfoceanGarbage extends InfoceanInfo {
  @override
  String get imageFolder => 'garbages';

  @override
  bool get shouldFlip => false;

  InfoceanGarbage(super.name, super.image, super.lifeLong);
}
