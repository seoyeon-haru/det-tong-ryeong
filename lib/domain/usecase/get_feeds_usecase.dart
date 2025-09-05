import 'package:team1_det_tonryong/domain/entity/home_entity.dart';
import 'package:team1_det_tonryong/domain/repository/feeds_repository.dart';

class GetFeedsUsecase {
  GetFeedsUsecase(this._feedsRepository);
  final FeedsRepository _feedsRepository;

  Future<List<HomeEntity>?> execute() async {
    return await _feedsRepository.getFeedsPhoto();
  }

  Future<void> delExecute(String id) async {
    await _feedsRepository.deleteFeed(id);
  }
}
