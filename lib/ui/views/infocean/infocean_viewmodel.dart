import 'package:plasticdiver/app/app.locator.dart';
import 'package:plasticdiver/services/diver_upgrade_service.dart';
import 'package:stacked/stacked.dart';

class InfoceanViewModel extends IndexTrackingViewModel {
  final _diverUpgradeService = locator<DiverUpgradeService>();

  int get diveDepthLevel => _diverUpgradeService.diveDepthLevel;

  List<InfoceanInfo> get source => currentIndex == 0 ? plasticGarbage : animals;

  final plasticGarbage = [
    InfoceanGarbage('Bottle', 'bottle.png', '450 years',
        'Plastic bottles are the most common type of plastic waste. They are made of polyethylene terephthalate (PET) and take 450 years to decompose.'),
    InfoceanGarbage('Household Cleaner', 'household_cleaner_bottle.png', '450 years',
        'Household cleaner bottles are made of high-density polyethylene (HDPE) and take 450 years to decompose.'),
    InfoceanGarbage('Microplastic', 'microplastic_cloud.png', 'Never',
        'Microplastics are small plastic particles that are less than 5mm in size. They are found in many personal care products and take forever to decompose.'),
    InfoceanGarbage('Plastic bag', 'plastic_bag.png', '10-20 years', 'Plastic bags are made of polyethylene and take 10-20 years to decompose.'),
    InfoceanGarbage('Shampoo bottle', 'shampoo_bottle.png', '450 years',
        'Shampoo bottles are made of high-density polyethylene (HDPE) and take 450 years to decompose.'),
    InfoceanGarbage('Soda can', 'soda_can.png', '200-500 years', 'Soda cans are made of aluminum and take 200-500 years to decompose.'),
    InfoceanGarbage('Straw', 'straw.png', '200 years', 'Straws are made of polypropylene and take 200 years to decompose.'),
    InfoceanGarbage('Cotton rod', 'cotton_rod.png', '200 years', 'Cotton rods are made of polypropylene and take 200 years to decompose.'),
    InfoceanGarbage('Toothbrush', 'tooth_brush.png', '450 years', 'Toothbrushes are made of polypropylene and take 450 years to decompose.'),
    InfoceanGarbage('Stirrer', 'stirrer.png', '200 years', 'Stirrers are made of polypropylene and take 200 years to decompose.'),
    InfoceanGarbage('Yogurt cup', 'yogurt_cup.png', '450 years', 'Yogurt cups are made of polystyrene and take 450 years to decompose.'),
    InfoceanGarbage('Plastic cutlery', 'fork.png', '200-500 years', 'Plastic cutlery is made of polystyrene and takes 200-500 years to decompose.'),
    InfoceanGarbage('Coffee cup', 'coffee_cup.png', '450 years', 'Coffee cups are made of polystyrene and take 450 years to decompose.'),
    InfoceanGarbage('Food packaging', 'food_packaging.png', '450 years', 'Food packaging is made of polystyrene and takes 450 years to decompose.'),
    InfoceanGarbage('Lid', 'lid.png', '450 years', 'Lids are made of polystyrene and take 450 years to decompose.'),
  ];

  final animals = [
    InfoceanAnimal(
        'Clown fish', 'clown_fish.png', '5-10 years', 'Clown fish are small, brightly colored fish that live in anemones. They live 5-10 years.', 0),
    InfoceanAnimal('Coral', 'coral_1.png', '100-1000 years', 'Coral is a marine invertebrate that lives in colonies. It can live 100-1000 years.', 0),
    InfoceanAnimal(
        'Exotic fish', 'exotic_fish.png', '5-10 years', 'Exotic fish are brightly colored fish that live in coral reefs. They live 5-10 years.', 0),
    InfoceanAnimal(
        'Tuna fish', 'tuna_fish.png', '5-10 years', 'Tuna fish are large, fast-swimming fish that live in the open ocean. They live 5-10 years.', 0),
    InfoceanAnimal(
        'Globe fish', 'globe_fish.png', '5-10 years', 'Globe fish are small, round fish that live in the open ocean. They live 5-10 years.', 1),
    InfoceanAnimal('Shark', 'shark.png', '20-30 years', 'Sharks are large, predatory fish that live in the open ocean. They live 20-30 years.', 1),
    InfoceanAnimal('Whale', 'whale.png', '40-90 years', 'Whales are large, marine mammals that live in the open ocean. They live 40-90 years.', 5),
    InfoceanAnimal(
        'Angler fish', 'anglerfish.png', '5-10 years', 'Angler fish are small, deep-sea fish that live in the open ocean. They live 5-10 years.', 5),
    InfoceanAnimal(
        'Dolphin', 'dolphin.png', '20-30 years', 'Dolphins are small, intelligent mammals that live in the open ocean. They live 20-30 years.', 3),
    InfoceanAnimal('Giant squid', 'giant_squid.png', '1-5 years',
        'Giant squids are large, deep-sea invertebrates that live in the open ocean. They live 1-5 years.', 4),
    InfoceanAnimal('Hammerhead shark', 'hammerhead_shark.png', '20-30 years',
        'Hammerhead sharks are large, predatory fish that live in the open ocean. They live 20-30 years.', 3),
    InfoceanAnimal('Jellyfish', 'jelly_fish.png', '1-5 years',
        'Jellyfish are small, transparent invertebrates that live in the open ocean. They live 1-5 years.', 1),
    InfoceanAnimal(
        'Lion fish', 'lion_fish.png', '5-10 years', 'Lion fish are small, brightly colored fish that live in coral reefs. They live 5-10 years.', 3),
    InfoceanAnimal(
        'Moon fish', 'moon_fish.png', '5-10 years', 'Moon fish are large, flat fish that live in the open ocean. They live 5-10 years.', 4),
    InfoceanAnimal('Parrot fish', 'parrot_fish.png', '5-10 years',
        'Parrot fish are small, brightly colored fish that live in coral reefs. They live 5-10 years.', 5),
    InfoceanAnimal(
        'Sea horse', 'sea_horse.png', '1-5 years', 'Sea horses are small, slow-swimming fish that live in coral reefs. They live 1-5 years.', 5),
    InfoceanAnimal('Sea turtle', 'sea_turtle.png', '20-30 years',
        'Sea turtles are large, slow-swimming reptiles that live in the open ocean. They live 20-30 years.', 4),
    InfoceanAnimal('Whale shark', 'whale_shark.png', '20-30 years',
        'Whale sharks are large, slow-swimming fish that live in the open ocean. They live 20-30 years.', 3),
    InfoceanAnimal('Angel fish', 'angel_fish.png', '5-10 years',
        'Angel fish are small, brightly colored fish that live in coral reefs. They live 5-10 years.', 5),
  ];
}

abstract class InfoceanInfo {
  final String name;
  final String image;

  final int requiredLevel;

  String get imagePath => 'assets/images/$imageFolder/$image';
  final String lifeLong;
  final String description;

  String get imageFolder;

  bool get shouldFlip;

  InfoceanInfo(this.name, this.image, this.lifeLong, this.description, [this.requiredLevel = 0]);
}

class InfoceanAnimal extends InfoceanInfo {
  @override
  String get imageFolder => 'animals';

  @override
  bool get shouldFlip => true;

  InfoceanAnimal(super.name, super.image, super.lifeLong, super.description, super.requiredLevel);
}

class InfoceanGarbage extends InfoceanInfo {
  @override
  String get imageFolder => 'garbages';

  @override
  bool get shouldFlip => false;

  InfoceanGarbage(super.name, super.image, super.lifeLong, super.description);
}
