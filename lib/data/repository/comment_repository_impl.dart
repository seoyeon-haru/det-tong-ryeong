import 'package:team1_det_tonryong/data/datasource/comment_data_source.dart';
import 'package:team1_det_tonryong/data/dto/comment_dto.dart';
import 'package:team1_det_tonryong/domain/entity/comment_entity.dart';
import 'package:team1_det_tonryong/domain/repository/comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  CommentRepositoryImpl(this._commentDataSource);
  final CommentDataSource _commentDataSource;

  @override
  Future<List<CommentEntity>> getComment(id) async {
    final result = await _commentDataSource.getComments(id);
    if (result.isEmpty) {
      return [];
    }
    return result
        .map(
          (doc) => CommentEntity(
            commentId: doc.commentId,
            commentTime: doc.commentTime,
            commentLike: doc.commentLike,
            commentUserNM: doc.commentUserNM,
            comment: doc.comment,
            cLikeUsers: doc.cLikeUsers,
            userProfil: doc.userProfil,
          ),
        )
        .toList();
  }

  @override
  Future<void> createComment({
    required String id,
    required String commentUserNM,
    required String comment,
    required String userProfil,
  }) async {
    final commentDto = CommentDto(
      commentId: '',
      commentTime: DateTime.now(),
      commentLike: 0,
      commentUserNM: commentUserNM,
      comment: comment,
      cLikeUsers: [],
      userProfil: userProfil,
    );
    await _commentDataSource.createComment(
      id: id,
      comment: commentDto,
    );
  }

  @override
  Future<void> updateCommentLike({
    required String commentId,
    required String feedId,
    required String userNM,
    required bool isLike,
  }) async {
    await _commentDataSource.updateCommentLike(
      commentId: commentId,
      feedId: feedId,
      userNM: userNM,
      isLike: isLike,
    );
  }
}
