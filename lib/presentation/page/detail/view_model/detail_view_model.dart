import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team1_det_tonryong/domain/entity/detail_entity.dart';
import 'package:team1_det_tonryong/domain/entity/home_entity.dart';
import 'package:team1_det_tonryong/presentation/detail_provider.dart';
import 'package:team1_det_tonryong/presentation/providers.dart';

final detailViewModelProvider = NotifierProvider.autoDispose
    .family<DetailViewModel, DetailState, String>(
      () => DetailViewModel(),
    );

class DetailViewModel extends AutoDisposeFamilyNotifier<DetailState, String> {
  @override
  DetailState build(
    String feedId,
  ) {
    fetchDetail(feedId);
    return DetailState(bestComments: [], feed: null);
  }

  Future<void> fetchDetail(String id) async {
    final getDetail = ref.read(detailUsecaseProvider);
    final result = await getDetail.execute(id);
    final feed = await ref.read(getFeedUsecaseProvider).execute(id);
    bool like = false;

    state = DetailState(bestComments: result, feed: feed);
  }

  Future<void> feedLikeUpdate({
    required bool liked,
    required String userNM,
  }) async {
    await ref
        .read(detailUsecaseProvider)
        .feedLikeUpdate(
          feedId: arg,
          liked: liked,
          userNM: userNM,
        );
    fetchDetail(arg);
  }
} //

class DetailState {
  List<DetailEntity> bestComments;
  HomeEntity? feed;
  DetailState({
    required this.bestComments,
    required this.feed,
  });
}
