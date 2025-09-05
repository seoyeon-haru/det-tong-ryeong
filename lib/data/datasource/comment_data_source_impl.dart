import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team1_det_tonryong/data/datasource/comment_data_source.dart';
import 'package:team1_det_tonryong/data/dto/comment_dto.dart';

class CommentDataSourceImpl implements CommentDataSource {
  @override
  /// 피드에 대한 댓글 불러오기
  Future<List<CommentDto>> getComments(id) async {
    try {
      final firestore = FirebaseFirestore.instance;
      final colRef = firestore.collection('feeds');
      final docRef = colRef.doc(id);
      final commentColRef = docRef.collection('comments');
      final result = await commentColRef
          .orderBy('commentLike', descending: true)
          .orderBy('commentTime', descending: false)
          .get();
      final doc = result.docs.map(
        (doc) {
          return CommentDto.fromJson(doc.id, doc.data());
        },
      ).toList();
      return doc;
    } catch (e) {
      // TODO: print Log로 바꾸는거 생각하기
      print(e);
      return List<CommentDto>.empty();
    }
  }

  @override
  Future<void> createComment({
    required String id,
    required CommentDto comment,
  }) async {
    try {
      final firestore = FirebaseFirestore.instance;
      final colRef = firestore.collection('feeds');
      final docRef = colRef.doc(id);
      final commentColRef = docRef.collection('comments');
      final result = await commentColRef.doc();
      result.set(comment.toJson());
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> updateCommentLike({
    required String commentId,
    required String feedId,
    required String userNM,
    required bool isLike,
  }) async {
    final firestore = FirebaseFirestore.instance;
    final colRef = firestore.collection('feeds');
    final docRef = colRef.doc(feedId);
    final commentColRef = docRef.collection('comments');
    final result = commentColRef.doc(commentId);
    await result.update({
      'commentLike': isLike
          ? FieldValue.increment(1)
          : FieldValue.increment(-1),
      'cLikeUsers': isLike
          ? FieldValue.arrayUnion([userNM])
          : FieldValue.arrayRemove([userNM]),
    });
  }
}
