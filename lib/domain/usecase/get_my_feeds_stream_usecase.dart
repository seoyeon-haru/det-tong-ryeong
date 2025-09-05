import 'package:team1_det_tonryong/domain/entity/home_entity.dart';
import 'package:team1_det_tonryong/domain/repository/feeds_repository.dart';

class GetMyFeedsStreamUsecase {
  GetMyFeedsStreamUsecase(this._feedsRepository);
  final FeedsRepository _feedsRepository;

  Stream<List<HomeEntity>> execute(String userNM) {
    return _feedsRepository.getMyFeeds(userNM);
  }
}
