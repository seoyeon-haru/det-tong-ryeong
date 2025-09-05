import 'package:team1_det_tonryong/domain/entity/home_entity.dart';

abstract interface class FeedsRepository {
  Future<List<HomeEntity>?> getFeedsPhoto();
  Stream<List<HomeEntity>> getMyFeeds(String userNM);
  Future<HomeEntity?> getFeed(String id);

  Future<void> deleteFeed(String id);
}
