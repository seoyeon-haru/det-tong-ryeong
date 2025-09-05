import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team1_det_tonryong/data/datasource/write_data_source.dart';
import 'package:team1_det_tonryong/data/datasource/write_data_source_impl.dart';
import 'package:team1_det_tonryong/data/repository/write_repository_impl.dart';
import 'package:team1_det_tonryong/domain/repository/write_repository.dart';
import 'package:team1_det_tonryong/domain/usecase/write_usercase.dart';

final _writeDataSourceProvider = Provider<WriteDataSource>(
  (ref) {
    return WriteDataSourceImpl();
  },
);

final _writeRepositoryProvider = Provider<WriteRepository>(
  (ref) {
    return WriteRepositoryImpl(
      ref.read(_writeDataSourceProvider),
    );
  },
);

final writeUsecaseProvider = Provider((ref) {
  return WriteUsercase(ref.read(_writeRepositoryProvider));
});
