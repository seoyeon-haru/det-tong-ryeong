import 'package:team1_det_tonryong/data/datasource/feeds_data_source.dart';
import 'package:team1_det_tonryong/domain/entity/detail_entity.dart';
import 'package:team1_det_tonryong/domain/repository/detail_repository.dart';

class DetailRepositoryImpl implements DetailRepository {
  DetailRepositoryImpl(this._feedsDataSource);
  final FeedsDataSource _feedsDataSource;

  @override
  Future<List<DetailEntity>> getDetailEntity(
    String id,
  ) async {
    final commentResult = await _feedsDataSource.getBestComments(
      id,
    );
    return commentResult.map(
      (doc) {
        return DetailEntity(
          cLikeUsers: doc.cLikeUsers,
          comment: doc.comment,
        );
      },
    ).toList();
  }

  @override
  Future<void> feedLikeUpdate({
    required String feedId,
    required bool liked,
    required String userNM,
  }) async {
    await _feedsDataSource.feedLikeUpdate(
      feedId: feedId,
      liked: liked,
      userNM: userNM,
    );
  }
}

//엔티티 2개를 가져와서 함치는 것
