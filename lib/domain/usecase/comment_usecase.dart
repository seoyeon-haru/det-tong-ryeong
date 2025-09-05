import 'package:team1_det_tonryong/domain/entity/comment_entity.dart';
import 'package:team1_det_tonryong/domain/repository/comment_repository.dart';

class CommentUsecase {
  CommentUsecase(this._commentRepository);
  final CommentRepository _commentRepository;

  Future<List<CommentEntity>> executeGetComment(
    String id,
  ) async {
    return await _commentRepository.getComment(id);
  }

  Future<void> executeCreateComment({
    required String id,
    required String commentUserNM,
    required String comment,
    required String userProfil,
  }) async {
    return await _commentRepository.createComment(
      id: id,
      commentUserNM: commentUserNM,
      comment: comment,
      userProfil: userProfil,
    );
  }

  Future<void> executeUpdataCommentLike({
    required String commentId,
    required String feedId,
    required String userNM,
    required bool isLike,
  }) async {
    return await _commentRepository.updateCommentLike(
      commentId: commentId,
      feedId: feedId,
      userNM: userNM,
      isLike: isLike,
    );
  }
}
