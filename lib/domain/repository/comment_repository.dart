import 'package:team1_det_tonryong/domain/entity/comment_entity.dart';

abstract interface class CommentRepository {
  Future<List<CommentEntity>> getComment(String id);
  Future<void> createComment({
    required String id,
    required String commentUserNM,
    required String comment,
    required String userProfil,
  });
  Future<void> updateCommentLike({
    required String commentId,
    required String feedId,
    required String userNM,
    required bool isLike,
  });
}
