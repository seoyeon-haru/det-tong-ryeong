import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team1_det_tonryong/data/datasource/feeds_data_source.dart';
import 'package:team1_det_tonryong/data/dto/comment_dto.dart';
import 'package:team1_det_tonryong/data/dto/feed_dto.dart';

class FeedsDataSourceImpl implements FeedsDataSource {
  DocumentSnapshot? _lastDoc;
  @override
  Future<List<FeedDto>?> getFeeds() async {
    final firestore = FirebaseFirestore.instance;
    Query<Map<String, dynamic>> colRef = firestore
        .collection('feeds')
        .orderBy('feedTime', descending: false)
        //  .orderBy(FieldPath.documentId, descending: true)
        .limit(10);
    if (_lastDoc != null) {
      colRef = colRef.startAfterDocument(
        _lastDoc!,
      );
    }
    final result = await colRef.get();

    final doc = result.docs;
    if (doc.isNotEmpty) {
      _lastDoc = doc.last;
      print(_lastDoc?.id);
    }
    return doc
        .map(
          (e) => FeedDto.fromJson(e.id, e.data()),
        )
        .toList();
  }

  // detail
  @override
  Future<FeedDto> getDetail(String id) async {
    final firestore = FirebaseFirestore.instance;
    final colRef = firestore.collection('feeds');
    final coldoc = colRef.doc(id);
    final result = await coldoc.get();
    final doc = FeedDto.fromJson(id, result.data()!);
    return doc;
  }

  @override
  /// 피드에 대한 댓글 불러오기
  Future<List<CommentDto>> getBestComments(id) async {
    try {
      final firestore = FirebaseFirestore.instance;
      final colRef = firestore.collection('feeds');
      final docRef = colRef.doc(id);
      final commentColRef = docRef.collection('comments');
      final result = await commentColRef
          .orderBy('commentLike', descending: true)
          .limit(4) // 내림차순으로 정렬하고 4개를 가져와라
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
  Stream<List<FeedDto>> getMyFeedsStream(String userNM) {
    final firestore = FirebaseFirestore.instance;
    final colRef = firestore.collection('feeds');
    final snapShot = colRef.where('userNM', isEqualTo: userNM).snapshots();
    return snapShot.map(
      (event) {
        return event.docs.map((e) => FeedDto.fromJson(e.id, e.data())).toList();
      },
    );
  }

  @override
  Future<void> feedLikeUpdate({
    required String feedId,
    required bool liked,
    required String userNM,
  }) async {
    final firestore = FirebaseFirestore.instance;
    final colref = firestore.collection('feeds');
    final docref = colref.doc(feedId);
    await docref.update({
      'feedLike': liked ? FieldValue.increment(1) : FieldValue.increment(-1),
      'fLikeUsers': liked
          ? FieldValue.arrayUnion([userNM])
          : FieldValue.arrayRemove([userNM]),
    });
  }

  Future<void> deleteFeed(String id) async {
    try {
      final firestore = FirebaseFirestore.instance;
      final colRef = firestore.collection('feeds');
      final docRef = colRef.doc(id);
      await docRef.delete();
      return;
    } catch (e) {
      print(e);
      return;
    }
  }
}
