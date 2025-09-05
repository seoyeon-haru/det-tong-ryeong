import 'package:team1_det_tonryong/domain/entity/home_entity.dart';
import 'package:team1_det_tonryong/domain/repository/feeds_repository.dart';

class GetFeedUsecase {
  GetFeedUsecase(this._feedsRepository);
  final FeedsRepository _feedsRepository;

  Future<HomeEntity?> execute(String id) async {
    return await _feedsRepository.getFeed(id);
  }
}
