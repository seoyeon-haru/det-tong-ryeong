import 'package:team1_det_tonryong/domain/entity/detail_entity.dart';

abstract interface class DetailRepository {
  Future<List<DetailEntity>> getDetailEntity(String id);
  Future<void> feedLikeUpdate({
    required String feedId,
    required bool liked,
    required String userNM,
  });
}
