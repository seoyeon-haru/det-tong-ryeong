import 'package:cloud_firestore/cloud_firestore.dart';

/// 피드에 대한 댓글 DTO 분리
class CommentDto {
  final String commentId;
  final DateTime commentTime;
  final int commentLike;
  final String commentUserNM;
  final String comment;
  final List<String> cLikeUsers;
  final String userProfil;

  CommentDto({
    required this.commentId,
    required this.commentTime,
    required this.commentLike,
    required this.commentUserNM,
    required this.comment,
    required this.cLikeUsers,
    required this.userProfil,
  });

  CommentDto.fromJson(String commentId, Map<String, dynamic> map)
    : this(
        commentId: commentId,
        commentTime: (map["commentTime"] as Timestamp).toDate(),
        commentLike: map["commentLike"],
        commentUserNM: map["commentUserNM"],
        comment: map["comment"],
        cLikeUsers: List<String>.from(map['cLikeUsers'] ?? []),
        userProfil: map["userProfil"],
      );
  Map<String, dynamic> toJson() {
    return {
      "commentTime": commentTime,
      "commentLike": commentLike,
      "commentUserNM": commentUserNM,
      "comment": comment,
      "cLikeUsers": cLikeUsers,
      "userProfil": userProfil,
    };
  }
}
