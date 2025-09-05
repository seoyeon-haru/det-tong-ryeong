import 'package:team1_det_tonryong/domain/entity/detail_entity.dart';
import 'package:team1_det_tonryong/domain/repository/detail_repository.dart';

class DetailUsecase {
  DetailUsecase(this._detailRepository);
  final DetailRepository _detailRepository;

  Future<List<DetailEntity>> execute(String id) async {
    return await _detailRepository.getDetailEntity(id);
  }

  Future<void> feedLikeUpdate({
    required String feedId,
    required bool liked,
    required String userNM,
  }) async {
    await _detailRepository.feedLikeUpdate(
      feedId: feedId,
      liked: liked,
      userNM: userNM,
    );
  }
}

//
