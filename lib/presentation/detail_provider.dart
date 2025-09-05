import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team1_det_tonryong/data/datasource/feeds_data_source.dart';
import 'package:team1_det_tonryong/data/datasource/feeds_data_source_impl.dart';
import 'package:team1_det_tonryong/data/repository/detail_repository_impl.dart';
import 'package:team1_det_tonryong/domain/repository/detail_repository.dart';
import 'package:team1_det_tonryong/domain/usecase/detail_usecase.dart';

final _detailDataSourceProvider = Provider<FeedsDataSource>(
  (ref) {
    return FeedsDataSourceImpl();
  },
);

final _detailRepositoryProvider = Provider<DetailRepository>(
  (ref) {
    return DetailRepositoryImpl(
      ref.read(_detailDataSourceProvider),
    );
  },
);

final detailUsecaseProvider = Provider(
  (ref) {
    return DetailUsecase(ref.read(_detailRepositoryProvider));
  },
);
