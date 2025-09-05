import 'package:team1_det_tonryong/data/dto/comment_dto.dart';

abstract interface class CommentDataSource {
  Future<List<CommentDto>> getComments(String id);
  Future<void> createComment({
    required String id,
    required CommentDto comment,
  });
  Future<void> updateCommentLike({
    required String commentId,
    required String feedId,
    required String userNM,
    required bool isLike,
  });
}
