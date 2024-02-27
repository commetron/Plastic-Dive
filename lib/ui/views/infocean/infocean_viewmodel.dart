import 'package:plasticdiver/app/app.locator.dart';
import 'package:plasticdiver/services/diver_upgrade_service.dart';
import 'package:stacked/stacked.dart';

class InfoceanViewModel extends IndexTrackingViewModel {
  final _diverUpgradeService = locator<DiverUpgradeService>();

  int get diveDepthLevel => _diverUpgradeService.diveDepthLevel;

  List<InfoceanInfo> get source => currentIndex == 0 ? plasticGarbage : animals;

  final plasticGarbage = [
    InfoceanGarbage(
        name: 'Bottle',
        image: 'bottle.png',
        lifeLong: '450 years',
        description:
            'Plastic bottles are the most common type of plastic waste. They are made of polyethylene terephthalate (PET) and take 450 years to decompose.',
        points: 30),
    InfoceanGarbage(
        name: 'Household Cleaner',
        image: 'household_cleaner_bottle.png',
        lifeLong: '450 years',
        description: 'Household cleaner bottles are made of high-density polyethylene (HDPE) and take 450 years to decompose.',
        points: 40),
    InfoceanGarbage(
        name: 'Microplastic',
        image: 'microplastic_cloud.png',
        lifeLong: 'Never',
        description:
            'Microplastics are small plastic particles that are less than 5mm in size. They are found in many personal care products and take forever to decompose.',
        points: 100),
    InfoceanGarbage(
        name: 'Plastic bag',
        image: 'plastic_bag.png',
        lifeLong: '10-20 years',
        description: 'Plastic bags are made of polyethylene and take 10-20 years to decompose.',
        points: 20),
    InfoceanGarbage(
        name: 'Shampoo bottle',
        image: 'shampoo_bottle.png',
        lifeLong: '450 years',
        description: 'Shampoo bottles are made of high-density polyethylene (HDPE) and take 450 years to decompose.',
        points: 30),
    InfoceanGarbage(
        name: 'Soda can',
        image: 'soda_can.png',
        lifeLong: '200-500 years',
        description: 'Soda cans are made of aluminum and take 200-500 years to decompose.',
        points: 40),
    InfoceanGarbage(
        name: 'Straw',
        image: 'straw.png',
        lifeLong: '200 years',
        description: 'Straws are made of polypropylene and take 200 years to decompose.',
        points: 10),
    InfoceanGarbage(
        name: 'Cotton rod',
        image: 'cotton_rod.png',
        lifeLong: '200 years',
        description: 'Cotton rods are made of polypropylene and take 200 years to decompose.',
        points: 10),
    InfoceanGarbage(
        name: 'Toothbrush',
        image: 'tooth_brush.png',
        lifeLong: '450 years',
        description: 'Toothbrushes are made of polypropylene and take 450 years to decompose.',
        points: 30),
    InfoceanGarbage(
        name: 'Stirrer',
        image: 'stirrer.png',
        lifeLong: '200 years',
        description: 'Stirrers are made of polypropylene and take 200 years to decompose.',
        points: 10),
    InfoceanGarbage(
        name: 'Yogurt cup',
        image: 'yogurt_cup.png',
        lifeLong: '450 years',
        description: 'Yogurt cups are made of polystyrene and take 450 years to decompose.',
        points: 40),
    InfoceanGarbage(
        name: 'Plastic cutlery',
        image: 'fork.png',
        lifeLong: '200-500 years',
        description: 'Plastic cutlery is made of polystyrene and takes 200-500 years to decompose.',
        points: 20),
    InfoceanGarbage(
        name: 'Coffee cup',
        image: 'coffee_cup.png',
        lifeLong: '450 years',
        description: 'Coffee cups are made of polystyrene and take 450 years to decompose.',
        points: 30),
    InfoceanGarbage(
        name: 'Food packaging',
        image: 'food_packaging.png',
        lifeLong: '450 years',
        description: 'Food packaging is made of polystyrene and takes 450 years to decompose.',
        points: 30),
    InfoceanGarbage(
        name: 'Lid',
        image: 'lid.png',
        lifeLong: '450 years',
        description: 'Lids are made of polystyrene and take 450 years to decompose.',
        points: 10),
  ];

  final animals = [
    // Level 0 - Unlocked directly
    InfoceanAnimal(
        name: 'Clown fish',
        image: 'clown_fish.png',
        lifeLong: '5-10 years',
        description: 'Clown fish are small, brightly colored fish that live in anemones. They live 5-10 years.',
        requiredLevel: 0,
        minDepth: 10,
        maxDepth: 1000),
    InfoceanAnimal(
        name: 'Coral',
        image: 'coral_1.png',
        lifeLong: '100-1000 years',
        description: 'Coral is a marine invertebrate that lives in colonies. It can live 100-1000 years.',
        requiredLevel: 0,
        minDepth: 10,
        maxDepth: 100),
    InfoceanAnimal(
        name: 'Exotic fish',
        image: 'exotic_fish.png',
        lifeLong: '5-10 years',
        description: 'Exotic fish are brightly colored fish that live in coral reefs. They live 5-10 years.',
        requiredLevel: 0,
        minDepth: 10,
        maxDepth: 1000),
    InfoceanAnimal(
        name: 'Tuna fish',
        image: 'tuna_fish.png',
        lifeLong: '5-10 years',
        description: 'Tuna fish are large, fast-swimming fish that live in the open ocean. They live 5-10 years.',
        requiredLevel: 0,
        minDepth: 10,
        maxDepth: 2000),

    // Level 1
    InfoceanAnimal(
        name: 'Jellyfish',
        image: 'jelly_fish.png',
        lifeLong: '1-5 years',
        description: 'Jellyfish are small, transparent invertebrates that live in the open ocean. They live 1-5 years.',
        requiredLevel: 1,
        minDepth: 10,
        maxDepth: 3000),
    InfoceanAnimal(
        name: 'Moon fish',
        image: 'moon_fish.png',
        lifeLong: '5-10 years',
        description: 'Moon fish are large, flat fish that live in the open ocean. They live 5-10 years.',
        requiredLevel: 1,
        minDepth: 10,
        maxDepth: 2000),

    // Level 2
    InfoceanAnimal(
        name: 'Globe fish',
        image: 'globe_fish.png',
        lifeLong: '5-10 years',
        description: 'Globe fish are small, round fish that live in the open ocean. They live 5-10 years.',
        requiredLevel: 2,
        minDepth: 10,
        maxDepth: 2000),

    InfoceanAnimal(
        name: 'Sea turtle',
        image: 'sea_turtle.png',
        lifeLong: '20-30 years',
        description: 'Sea turtles are large, slow-swimming reptiles that live in the open ocean. They live 20-30 years.',
        requiredLevel: 2,
        minDepth: 10,
        maxDepth: 2000),

    InfoceanAnimal(
        name: 'Parrot fish',
        image: 'parrot_fish.png',
        lifeLong: '5-10 years',
        description: 'Parrot fish are small, brightly colored fish that live in coral reefs. They live 5-10 years.',
        requiredLevel: 2,
        minDepth: 10,
        maxDepth: 100),

    // Level 3
    InfoceanAnimal(
        name: 'Angel fish',
        image: 'angel_fish.png',
        lifeLong: '5-10 years',
        description: 'Angel fish are small, brightly colored fish that live in coral reefs. They live 5-10 years.',
        requiredLevel: 3,
        minDepth: 20,
        maxDepth: 100),
    InfoceanAnimal(
        name: 'Sea horse',
        image: 'sea_horse.png',
        lifeLong: '1-5 years',
        description: 'Sea horses are small, slow-swimming fish that live in coral reefs. They live 1-5 years.',
        requiredLevel: 3,
        minDepth: 50,
        maxDepth: 2000),
    InfoceanAnimal(
        name: 'Dolphin',
        image: 'dolphin.png',
        lifeLong: '20-30 years',
        description: 'Dolphins are small, intelligent mammals that live in the open ocean. They live 20-30 years.',
        requiredLevel: 3,
        minDepth: 30,
        maxDepth: 300),
    InfoceanAnimal(
        name: 'Shark',
        image: 'shark.png',
        lifeLong: '20-30 years',
        description: 'Sharks are large, predatory fish that live in the open ocean. They live 20-30 years.',
        requiredLevel: 3,
        minDepth: 3000,
        maxDepth: 6000),

    // Level 4
    InfoceanAnimal(
        name: 'Hammerhead shark',
        image: 'hammerhead_shark.png',
        lifeLong: '20-30 years',
        description: 'Hammerhead sharks are large, predatory fish that live in the open ocean. They live 20-30 years.',
        requiredLevel: 4,
        minDepth: 3000,
        maxDepth: 6000),
    InfoceanAnimal(
        name: 'Giant squid',
        image: 'giant_squid.png',
        lifeLong: '1-5 years',
        description: 'Giant squids are large, deep-sea invertebrates that live in the open ocean. They live 1-5 years.',
        requiredLevel: 4,
        minDepth: 3000,
        maxDepth: 6000),
    InfoceanAnimal(
        name: 'Lion fish',
        image: 'lion_fish.png',
        lifeLong: '5-10 years',
        description: 'Lion fish are small, brightly colored fish that live in coral reefs. They live 5-10 years.',
        requiredLevel: 3,
        minDepth: 3000,
        maxDepth: 6000),
    InfoceanAnimal(
        name: 'Whale shark',
        image: 'whale_shark.png',
        lifeLong: '20-30 years',
        description: 'Whale sharks are large, slow-swimming fish that live in the open ocean. They live 20-30 years.',
        requiredLevel: 4,
        minDepth: 10,
        maxDepth: 2000),

    // Level 5
    InfoceanAnimal(
        name: 'Whale',
        image: 'whale.png',
        lifeLong: '40-90 years',
        description: 'Whales are large, marine mammals that live in the open ocean. They live 40-90 years.',
        requiredLevel: 5,
        minDepth: 5000,
        maxDepth: 7500),
    InfoceanAnimal(
        name: 'Angler fish',
        image: 'anglerfish.png',
        lifeLong: '5-10 years',
        description: 'Angler fish are small, deep-sea fish that live in the open ocean. They live 5-10 years.',
        requiredLevel: 5,
        minDepth: 5000,
        maxDepth: 7500),
  ];
}

abstract class InfoceanInfo {
  final String name;
  final String image;

  final int requiredLevel;
  final int? points;

  int? get collectionTime => points == null ? null : points! ~/ 10;

  final int? minDepth;
  final int? maxDepth;

  String get imagePath => 'assets/images/$imageFolder/$image';
  final String lifeLong;
  final String description;

  String get imageFolder;

  bool get shouldFlip;

  InfoceanInfo({
    required this.name,
    required this.image,
    required this.lifeLong,
    required this.description,
    this.points,
    this.requiredLevel = 0,
    this.minDepth,
    this.maxDepth,
  });
}

class InfoceanAnimal extends InfoceanInfo {
  @override
  String get imageFolder => 'animals';

  @override
  bool get shouldFlip => true;

  InfoceanAnimal({
    required super.name,
    required super.image,
    required super.lifeLong,
    required super.description,
    super.requiredLevel,
    super.minDepth,
    super.maxDepth,
  });
}

class InfoceanGarbage extends InfoceanInfo {
  @override
  String get imageFolder => 'garbages';

  @override
  bool get shouldFlip => false;

  InfoceanGarbage({
    required super.name,
    required super.image,
    required super.lifeLong,
    required super.description,
    required super.points,
  });
}
