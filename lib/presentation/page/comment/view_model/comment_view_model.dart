import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team1_det_tonryong/domain/entity/comment_entity.dart';
import 'package:team1_det_tonryong/presentation/comment_provider.dart';

class CommentViewModel
    extends
        AutoDisposeFamilyNotifier<List<CommentEntity>, String> {
  @override
  build(String id) {
    fetchGetComments(id);
    return [];
  }

  Future<void> fetchGetComments(String id) async {
    final getComments = ref.read(commentUsecaseProvider);
    final result = await getComments.executeGetComment(id);
    state = result;
  }

  Future<void> fetchCreateComment({
    required String id,
    required String commentUserNM,
    required String comment,
    required String userProfil,
  }) async {
    await ref
        .read(commentUsecaseProvider)
        .executeCreateComment(
          userProfil: userProfil,
          id: id,
          comment: comment,
          commentUserNM: commentUserNM,
        );
  }

  Future<void> fetchUpdateCommentLike({
    required String commentId,
    required String feedId,
    required String userNM,
    required bool isLike,
  }) async {
    await ref
        .read(commentUsecaseProvider)
        .executeUpdataCommentLike(
          commentId: commentId,
          feedId: feedId,
          userNM: userNM,
          isLike: isLike,
        );
  }
}

final commentViewModelProvider = NotifierProvider.autoDispose
    .family<CommentViewModel, List<CommentEntity>, String>(
      () => CommentViewModel(),
    );
