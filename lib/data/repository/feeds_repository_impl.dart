import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team1_det_tonryong/data/datasource/feeds_data_source.dart';
import 'package:team1_det_tonryong/domain/entity/home_entity.dart';
import 'package:team1_det_tonryong/domain/repository/feeds_repository.dart';

class FeedsRepositoryImpl implements FeedsRepository {
  FeedsRepositoryImpl(this._feedsDataSource, this.firestore);
  final FeedsDataSource _feedsDataSource;
  final FirebaseFirestore firestore;
  @override
  Future<List<HomeEntity>?> getFeedsPhoto() async {
    final result = await _feedsDataSource.getFeeds();
    if (result == null) {
      return null;
    }
    return result
        .map(
          (e) => HomeEntity(
            feedPhoto: e.feedPhoto,
            feedId: e.feedId,
            feedTime: e.feedTime,
            fLikeUsers: e.fLikeUsers,
            userNM: e.userNM,
          ),
        )
        .toList();
  }

  @override
  Stream<List<HomeEntity>> getMyFeeds(String userNM) {
    return _feedsDataSource.getMyFeedsStream(userNM).map(
      (event) {
        return event
            .map(
              (e) => HomeEntity(
                feedPhoto: e.feedPhoto,
                feedId: e.feedId,
                feedTime: e.feedTime,
                fLikeUsers: e.fLikeUsers,
                userNM: e.userNM,
              ),
            )
            .toList();
      },
    );
  }

  @override
  Future<HomeEntity?> getFeed(String id) async {
    final result = await _feedsDataSource.getDetail(id);
    return HomeEntity(
      feedPhoto: result.feedPhoto,
      feedId: result.feedId,
      feedTime: result.feedTime,
      fLikeUsers: result.fLikeUsers,
      userNM: result.userNM,
    );
  }

  @override
  Future<void> deleteFeed(String id) async {
    //데이타 소스 매서드 열어주기
    await _feedsDataSource.deleteFeed(id);
  }
}
