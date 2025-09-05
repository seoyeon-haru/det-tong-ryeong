import 'package:cloud_firestore/cloud_firestore.dart';

class FeedDto {
  final String feedId;
  final String userNM;
  final DateTime feedTime;
  final int feedLike;
  final String feedPhoto;
  final List<String> fLikeUsers;

  FeedDto({
    required this.feedId,
    required this.userNM,
    required this.feedTime,
    required this.feedLike,
    required this.feedPhoto,
    required this.fLikeUsers,
  });

  FeedDto.fromJson(String feedId, Map<String, dynamic> map)
    : this(
        feedId: feedId,
        userNM: map["userNM"],
        feedTime: (map["feedTime"] as Timestamp).toDate(),
        feedLike: map["feedLike"],
        feedPhoto: map["feedPhoto"],
        fLikeUsers: List<String>.from(map['fLikeUsers'] ?? []),
      );

  Map<String, dynamic> toJson() {
    return {
      "userNM": userNM,
      "feedTime": feedTime,
      "feedLike": feedLike,
      "feedPhoto": feedPhoto,
      "fLikeUsers": fLikeUsers,
    };
  }
}
