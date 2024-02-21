import 'package:cloud_firestore/cloud_firestore.dart';

class LeaderboardEntry {
  final String pseudo;
  final int score;
  final Timestamp createdAt;
  final int collectingSpeedLevel;
  final int diveDepthLevel;
  final int swimmingSpeedLevel;
  final int airTankLevel;

  LeaderboardEntry({
    required this.pseudo,
    required this.score,
    required this.collectingSpeedLevel,
    required this.diveDepthLevel,
    required this.swimmingSpeedLevel,
    required this.airTankLevel,
    Timestamp? createdAt,
  }) : createdAt = createdAt ?? Timestamp.now();

  static LeaderboardEntry fromJson(Map<String, dynamic> data) {
    return LeaderboardEntry(
      pseudo: data['pseudo'] as String,
      score: data['score'] as int,
      createdAt: data['createdAt'] as Timestamp,
      collectingSpeedLevel: data['collectingSpeedLevel'] as int,
      diveDepthLevel: data['diveDepthLevel'] as int,
      swimmingSpeedLevel: data['swimmingSpeedLevel'] as int,
      airTankLevel: data['airTankLevel'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pseudo': pseudo,
      'score': score,
      'createdAt': createdAt,
      'collectingSpeedLevel': collectingSpeedLevel,
      'diveDepthLevel': diveDepthLevel,
      'swimmingSpeedLevel': swimmingSpeedLevel,
      'airTankLevel': airTankLevel,
    };
  }
}

class LeaderboardService {
  static const int limit = 10;
  static const String collectionName = 'leaderboard';
  static const String scoreField = 'score';

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<List<LeaderboardEntry>> getLeaderboard({int limit = 10}) async {
    final QuerySnapshot querySnapshot = await _firebaseFirestore.collection(collectionName).orderBy(scoreField, descending: true).limit(limit).get();

    return querySnapshot.docs.toLeaderboard();
  }

  Future<void> addScore(LeaderboardEntry entry) async {
    if (entry.score <= 0 || entry.pseudo.isEmpty) {
      return;
    }

    // TODO write only if in the top 10 ?
    // https://github.com/flutter/super_dash/blob/f3562d60167f597a21d6fd503579631b51b21aae/packages/leaderboard_repository/lib/src/leaderboard_repository.dart#L76
    await _firebaseFirestore.collection(collectionName).add(entry.toJson());
  }
}

// TODO move to dedicated class
extension on List<QueryDocumentSnapshot> {
  List<LeaderboardEntry> toLeaderboard() {
    final leaderboardEntries = <LeaderboardEntry>[];
    for (final document in this) {
      final data = document.data() as Map<String, dynamic>?;
      if (data != null) {
        // TODO
        // try {
        leaderboardEntries.add(LeaderboardEntry.fromJson(data));
        // } catch (error, stackTrace) {
        //  throw LeaderboardDeserializationException(error, stackTrace);
        // }
      }
    }
    return leaderboardEntries;
  }
}
